import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/extensions/mediaquery_size.dart';
import 'package:hungry/core/extensions/padding_extension.dart';
import 'package:hungry/core/utils/app_assets.dart';
import 'package:hungry/core/utils/app_styles.dart';
import '../../../../core/utils/app_colors.dart';
import 'customize_your_meal_text_widget.dart';
import 'spicy_slider.dart';
import 'topping.dart';
import 'total_price_and_add_to_cart.dart';

class MealDetailsViewBody extends StatelessWidget {
  const MealDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16.h),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new_outlined, size: 24.sp),
          ),
        ),
        Gap(4.h),
        Row(
          children: [
            Image.asset(
              AppImages.splashBurger,
              height: context.height * .3,
              width: context.width * 0.4,
            ),
            Gap(context.width * .1.w),
            Expanded(
              child: Column(
                children: [
                  CustomizeYourMealTextWidget(),
                  Gap(16),
                  SpicySlider(),
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
        SizedBox(
          height: 140.h,
          child: ListView.separated(
            itemCount: 1,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => Gap(8.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (__, index) => Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Topping(),
            ),
          ),
        ),
        Gap(32.h),
        Text(
          'Side options',
          style: AppStyles.semiBold16.copyWith(color: AppColors.brown),
        ).withHorizontalPadding(16),

        SizedBox(
          height: 140.h,
          child: ListView.separated(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => Gap(8.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (__, index) => Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Topping(),
            ),
          ),
        ),

        Gap(50.h),
        TotalPriceAndAddToCart().withHorizontalPadding(16.r),
        Gap(30.w),
      ],
    );
  }
}
