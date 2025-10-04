import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_assets.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/utils/app_styles.dart';

import '../../../../core/utils/app_shadwo.dart';

class MealCardItem extends StatelessWidget {
  const MealCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        boxShadow: [AppShadwo.boxShadwo],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.h,
        children: [
          Center(
            child: Image.asset(
              AppImages.splashBurger,
              height: 120.h,
              width: 120.w,
              fit: BoxFit.fill,
            ),
          ),
          Gap(5.h),
          Text(
            'Cheeseburger',
            style: AppStyles.semiBold16.copyWith(color: AppColors.brown),
          ),
          Text(
            'Wendy\'s Burger',
            style: AppStyles.regular16.copyWith(color: AppColors.brown),
          ),
          Row(
            spacing: 3.w,
            children: [
              Icon(Icons.star, color: Colors.amberAccent, size: 16.sp),
              Text(
                '4.5',
                style: AppStyles.medium16.copyWith(color: AppColors.brown),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
