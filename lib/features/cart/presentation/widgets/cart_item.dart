import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/extensions/mediaquery_size.dart';
import 'package:hungry/features/cart/data/models/order_item_model.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_shadwo.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/default_app_button.dart';
import 'increment_and_decrement_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.orderItem});
  final OrderItemModel orderItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [AppShadwo.boxShadwo],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNetworkImage(
                  img: orderItem.image,
                  width: context.width * 1 / 3,
                  height: 100.h,
                ),
                Gap(8.h),
                Text(
                  orderItem.name,
                  style: AppStyles.semiBold16.copyWith(color: AppColors.brown),
                ),
              ],
            ),
          ),
          Gap(context.width * .1.w),
          Expanded(
            child: Column(
              children: [
                IncrementAndDecrementButton(),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: DefaultAppButton(text: 'Remove', onPressed: () {}),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
