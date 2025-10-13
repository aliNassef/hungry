import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/extensions/mediaquery_size.dart';
import 'package:hungry/core/utils/app_dilagos.dart';
import 'package:hungry/core/widgets/custom_failure_widget.dart';
import 'package:hungry/features/auth/presentation/views/login_view.dart';
import 'package:hungry/features/profile/presentation/controller/profile_cubit/profile_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/navigation/app_navigation.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_shadwo.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import 'profile_top_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: context.height,
      width: context.width,
      color: AppColors.primary,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (_, current) =>
            current is ProfileLoaded ||
            current is ProfileLoading ||
            current is ProfileFailure,
        builder: (context, state) {
          if (state is ProfileFailure) {
            return CustomFailureWidget(message: state.errMessage);
          }

          if (state is ProfileLoading) {
            return Skeletonizer(
              enabled: true,
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
                  CustomTextFormField(
                    label: 'Delivery address',
                    hint: 'John Doe',
                  ),
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
            );
          }
          if (state is ProfileLoaded) {
            return Column(
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
                      image: CachedNetworkImageProvider(state.profile.image),
                    ),
                  ),
                ),
                Gap(32.h),
                CustomTextFormField(label: 'Name', hint: state.profile.name),
                Gap(32.h),
                CustomTextFormField(label: 'Email', hint: state.profile.email),
                Gap(32.h),
                CustomTextFormField(
                  label: 'Delivery address',
                  hint: state.profile.address ?? 'No address yet',
                ),
                Gap(32.h),
                CustomTextFormField(label: 'Password', hint: '********'),
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
                      child: BlocListener<ProfileCubit, ProfileState>(
                        listener: (context, state) {
                          if (state is ProfileLogoutSuccess) {
                            AppNavigation.pop(context, useAppRoute: true);
                            AppDilagos.showToast(
                              text: 'Logged out successfully',
                            );
                            AppNavigation.pushAndRemoveUntil(
                              context,
                              LoginView.routeName,
                              (route) => false,
                              useAppRoute: true,
                            );
                          }
                          if (state is ProfileLogoutFailure) {
                            AppDilagos.showErrorMessage(
                              context,
                              errMessage: 'Failed to log out',
                            );
                          }
                          if (state is ProfileLogoutLoading) {
                            AppDilagos.showLoadingBox(context);
                          }
                        },
                        child: DefaultAppButton(
                          onPressed: () {
                            context.read<ProfileCubit>().logout();
                          },
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
                    ),
                  ],
                ),
                Gap(30.w),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
