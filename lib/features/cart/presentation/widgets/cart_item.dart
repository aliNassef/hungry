import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/extensions/mediaquery_size.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_shadwo.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/default_app_button.dart';
import 'increment_and_decrement_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.splashBurger, width: context.width * 1 / 3),
              Gap(8.h),
              Text(
                'Cheeseburger',
                style: AppStyles.semiBold16.copyWith(color: AppColors.brown),
              ),
              Text(
                'Wendy\'s Burger',
                style: AppStyles.regular16.copyWith(color: AppColors.brown),
              ),
            ],
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
