import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/extensions/mediaquery_size.dart';
import 'package:hungry/core/utils/app_assets.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/utils/app_shadwo.dart';
import 'package:hungry/core/widgets/default_app_button.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/profile_top_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: context.height,
        width: context.width,
        color: AppColors.primary,
        child: Column(
          children: [
            Gap(16.h),
            ProfileTopBar(),
            Gap(24.h),
            Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [AppShadwo.boxShadwo3],
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBurger),
                ),
              ),
            ),
            Gap(32.h),
            CustomTextFormField(label: 'Name', hint: 'John Doe'),
            Gap(32.h),
            CustomTextFormField(label: 'Email', hint: 'John Doe'),
            Gap(32.h),
            CustomTextFormField(label: 'Delivery address', hint: 'John Doe'),
            Gap(32.h),
            CustomTextFormField(label: 'Password', hint: 'John Doe'),
            Gap(32.h),
            Divider(
              color: AppColors.light,
              thickness: 1.h,
              indent: 24.w,
              endIndent: 24.w,
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: DefaultAppButton(
                    text: 'Edit Profile',
                    textColor: AppColors.primary,
                    backgroundColor: AppColors.light,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.edit_note,
                        color: AppColors.primary,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
                Gap(16.w),
                Expanded(
                  child: DefaultAppButton(
                    text: 'Log out',
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.logout,
                        color: AppColors.light,
                        size: 32.sp,
                      ),
                    ),
                    borderColor: AppColors.light,
                    borderWidth: 3.w,
                  ),
                ),
              ],
            ),
            Gap(30.w),
          ],
        ),
      ),
    );
  }
}
