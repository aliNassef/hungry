import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/navigation/app_navigation.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../cart/presentation/controller/cart_cubit/cart_cubit.dart';
import '../controller/get_toppings_and_side_optionscubit/get_toppings_and_side_options_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dilagos.dart';
import '../../../cart/data/models/cart_item_input_model.dart';
import '../../data/models/meal_model.dart';
import 'customize_your_meal_text_widget.dart';
import 'side_options_list_items.dart';
import 'spicy_slider.dart';
import 'toppings_list_items.dart';
import 'total_price_and_add_to_cart.dart';

class MealDetailsViewBody extends StatefulWidget {
  const MealDetailsViewBody({super.key, required this.meal});
  final MealModel meal;

  @override
  State<MealDetailsViewBody> createState() => _MealDetailsViewBodyState();
}

class _MealDetailsViewBodyState extends State<MealDetailsViewBody> {
  late ValueNotifier<double> spicyValue;

  late ValueNotifier<List<int>> toppings;
  late ValueNotifier<List<int>> sideOptions;
  @override
  void initState() {
    super.initState();
    Future.wait([
      context.read<GetToppingsAndSideOptionsCubit>().getToppings(),
      context.read<GetToppingsAndSideOptionsCubit>().getSideOptions(),
    ]);
    spicyValue = ValueNotifier(0.5);
    toppings = ValueNotifier([]);
    sideOptions = ValueNotifier([]);
  }

  @override
  void dispose() {
    spicyValue.dispose();
    toppings.dispose();
    sideOptions.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16.h),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              AppNavigation.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined, size: 24.sp),
          ),
        ),
        Gap(4.h),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.0.w),
              child: CustomNetworkImage(
                img: widget.meal.image,
                height: context.height * .3,
                width: context.width * 0.4,
              ),
            ),
            Gap(context.width * .1.w),
            Expanded(
              child: Column(
                children: [
                  CustomizeYourMealTextWidget(
                    name: widget.meal.name,
                    desc: widget.meal.description,
                  ),
                  const Gap(16),
                  SpicySlider(spicyValue: spicyValue),
                ],
              ).withHorizontalPadding(16),
            ),
          ],
        ),
        Gap(25.h),
        Text(
          'Toppings',
          style: AppStyles.semiBold16.copyWith(color: AppColors.brown),
        ).withHorizontalPadding(16),
        ToppingsListItems(toppings: toppings),
        Gap(32.h),
        Text(
          'Side options',
          style: AppStyles.semiBold16.copyWith(color: AppColors.brown),
        ).withHorizontalPadding(16),
        SideOptionsListItems(sideOptions: sideOptions),
        Gap(50.h),
        BlocListener<CartCubit, CartState>(
          listenWhen: (previous, current) =>
              current is CartAdded ||
              current is CartAddError ||
              current is CartAddLoading,
          listener: (context, state) {
            if (state is CartAdded) {
              AppNavigation.pop(context, useAppRoute: true);
              AppDilagos.showToast(text: 'Added to cart');
            } else if (state is CartAddError) {
              AppNavigation.pop(context, useAppRoute: true);
              AppDilagos.showErrorMessage(
                context,
                errMessage: state.errMessage,
              );
            } else {
              AppDilagos.showLoadingBox(context);
            }
          },
          child: TotalPriceAndAddToCart(
            price: widget.meal.price,
            onPressed: () {
              var cartItemModel = CartItemInputModel(
                productId: widget.meal.id,
                quantity: 1,
                sideOptions: sideOptions.value,
                spicy: spicyValue.value,
                toppings: toppings.value,
              );
              context.read<CartCubit>().addToCart(cartItemModel);
            },
          ),
        ).withHorizontalPadding(16.r),
        Gap(30.w),
      ],
    );
  }
}
