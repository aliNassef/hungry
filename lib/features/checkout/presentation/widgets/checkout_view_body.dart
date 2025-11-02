import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/navigation/app_navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dilagos.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../cart/data/models/order_model.dart';
import '../../data/model/checkout_input_model.dart';
import '../../data/model/checkout_item_model.dart';
import '../controller/checkout_cubit/checkout_cubit.dart';
import 'checkout_price_info_details.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16.h),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            AppNavigation.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        Gap(16.h),

        Text(
          'Order summary',
          style: AppStyles.semiBold16.copyWith(
            fontSize: 20.sp,
            color: AppColors.brown,
          ),
        ),
        Gap(20.h),
        CheckoutPriceInfoDetails(desc: 'Order', price: '#${order.id}'),
        Gap(20.h),

        ...order.items.map(
          (e) => CheckoutPriceInfoDetails(
            desc: e.name,
            price: 'Qty: ${e.quantity}',
          ),
        ),
        // const CheckoutPriceInfoDetails(desc: 'Taxes', price: '\$16.48'),
        // const CheckoutPriceInfoDetails(desc: 'Delivery fees', price: '\$16.48'),
        Gap(9.h),
        Divider(indent: 16.w, endIndent: 16.w, color: const Color(0xffF0F0F0)),
        Gap(9.h),
        Row(
          children: [
            Text(
              'Total:',
              style: AppStyles.semiBold16.copyWith(
                fontSize: 18.sp,
                color: AppColors.brown,
              ),
            ),
            const Spacer(),
            Text(
              '\$${order.calcTotalPrice()}',
              style: AppStyles.semiBold16.copyWith(
                fontSize: 18.sp,
                color: AppColors.brown,
              ),
            ),
          ],
        ).withHorizontalPadding(10.r),
        Gap(16.h),
        Row(
          children: [
            Text(
              'Estimated delivery time:',
              style: AppStyles.semiBold16.copyWith(
                fontSize: 14.sp,
                color: AppColors.brown,
              ),
            ),
            const Spacer(),
            Text(
              '15 - 30 mins',
              style: AppStyles.semiBold16.copyWith(
                fontSize: 14.sp,
                color: AppColors.brown,
              ),
            ),
          ],
        ).withHorizontalPadding(10.r),
        const Spacer(),
        AddOrderButtonblocListener(order: order),
        Gap(30.h),
      ],
    ).withHorizontalPadding(16);
  }
}

class AddOrderButtonblocListener extends StatelessWidget {
  const AddOrderButtonblocListener({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listenWhen: (previous, current) =>
          current is CheckoutLoaded ||
          current is CheckoutFailure ||
          current is CheckoutLoading,
      listener: (context, state) {
        if (state is CheckoutLoading) {
          AppDilagos.showLoadingBox(context);
        }
        if (state is CheckoutFailure) {
          AppLogger.debug('Order placed failed: ${state.errMessage}');

          AppNavigation.pop(context, useAppRoute: true);
          AppDilagos.showErrorMessage(context, errMessage: state.errMessage);
        }
        if (state is CheckoutLoaded) {
          AppLogger.debug('Order placed successfully');
          AppNavigation.pop(context, useAppRoute: true);
          AppDilagos.showToast(
            text: 'Your order has been placed successfully!',
          );
        }
      },
      child: DefaultAppButton(
        text: 'Order now',
        onPressed: () {
          var checkoutInput = CheckoutInputModel(
            items: order.items
                .map(
                  (e) => CheckoutItemModel(
                    productId: e.productId,
                    quantity: e.quantity,
                    spicy: e.spicy ?? 0,
                    toppings: e.toppings.map((t) => t.id).toList(),
                    sideOptions: e.sideOptions.map((t) => t.id).toList(),
                  ),
                )
                .toList(),
          );
          context.read<CheckoutCubit>().addOrder(checkoutInput);
        },
      ),
    );
  }
}
