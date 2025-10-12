import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/navigation/app_navigation.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/utils/app_styles.dart';
import 'package:hungry/core/widgets/custom_network_image.dart';
import 'package:hungry/features/home/data/models/meal_model.dart';

import '../../../../core/navigation/nav_animation_enum.dart';
import '../../../../core/navigation/nav_args.dart';
import '../../../../core/utils/app_shadwo.dart';
import '../view/meal_details_view.dart';

class MealCardItem extends StatelessWidget {
  const MealCardItem({super.key, required this.meal});
  final MealModel meal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _goToMealDetails(context);
      },
      child: Container(
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
              child: CustomNetworkImage(
                img: meal.image,
                width: 120.w,
                height: 120.h,
              ),
            ),
            Gap(5.h),
            Text(
              meal.name,
              style: AppStyles.semiBold16.copyWith(color: AppColors.brown),
            ),

            Row(
              spacing: 3.w,
              children: [
                Icon(Icons.star, color: Colors.amberAccent, size: 16.sp),
                Text(
                  meal.rating,
                  style: AppStyles.medium16.copyWith(color: AppColors.brown),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _goToMealDetails(BuildContext context) {
    AppNavigation.pushNamed(
      context,
      MealDetailsView.routeName,
      arguments: NavArgs(animation: NavAnimation.fade),
    );
  }
}
