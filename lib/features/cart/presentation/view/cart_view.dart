import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/extensions/mediaquery_size.dart';
import 'package:hungry/core/extensions/padding_extension.dart';
import 'package:hungry/features/cart/presentation/widgets/cart_item.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../data/models/order_item_model.dart';
import '../../data/models/order_model.dart';
import '../controller/cart_cubit/cart_cubit.dart';
import '../widgets/empty_cart_widget.dart';
import '../widgets/total_price_and_checkout_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartItems();
  }

  List<OrderItemModel> cartMeals = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) =>
                current is CartLoading ||
                current is CartError ||
                current is CartLoaded ||
                current is CartRemoved,
            builder: (context, state) {
              if (state is CartRemoved) {
                cartMeals = cartMeals
                    .where((meal) => meal.itemId != state.id)
                    .toList();
                AppLogger.info(
                  'cartMeals length after removal: ${cartMeals.length}',
                );
                if (cartMeals.isEmpty) {
                  return EmptyCartWidget();
                }
                return _buildCartList(context, cartMeals);
              }

              if (state is CartLoading) {
                return _buildCartList(
                  context,
                  OrderModel.dummy.items,
                  isLoading: true,
                );
              } else if (state is CartError) {
                return CustomFailureWidget(message: state.errMessage);
              } else if (state is CartLoaded) {
                if (state.orderModel.items.isEmpty) {
                  return EmptyCartWidget();
                }
                cartMeals = state.orderModel.items;
                return _buildCartList(context, cartMeals);
              }
              return SizedBox.shrink();
            },
          ),
          Spacer(),
          TotalpriceAndCheckoutButton(),
          Gap(16.h),
        ],
      ).withHorizontalPadding(16.r),
    );
  }

  Widget _buildCartList(
    BuildContext context,
    List<OrderItemModel> cartMeals, {
    bool isLoading = false,
  }) {
    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
        height: context.height * .8,
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async {
            context.read<CartCubit>().getCartItems();
          },
          child: ListView.separated(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 16.h),
            itemBuilder: (__, index) {
              return SizedBox(
                height: 200.h,
                child: CartItem(orderItem: cartMeals[index]),
              );
            },
            separatorBuilder: (context, index) => Gap(24.h),
            itemCount: cartMeals.length,
          ),
        ),
      ),
    );
  }
}
