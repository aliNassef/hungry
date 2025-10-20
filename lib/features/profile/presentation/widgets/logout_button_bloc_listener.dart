import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigation/app_navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dilagos.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../auth/presentation/views/login_view.dart';
import '../controller/profile_cubit/profile_cubit.dart';

class LogoutButtonBloclistener extends StatelessWidget {
  const LogoutButtonBloclistener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is ProfileLogoutLoading ||
          current is ProfileLogoutSuccess ||
          current is ProfileLogoutFailure,
      listener: (context, state) {
        if (state is ProfileLogoutSuccess) {
          AppNavigation.pop(context, useAppRoute: true);
          AppDilagos.showToast(text: 'Logged out successfully');
          AppNavigation.pushAndRemoveUntil(
            context,
            LoginView.routeName,
            (route) => false,
            useAppRoute: true,
          );
        }
        if (state is ProfileLogoutFailure) {
          AppDilagos.showErrorMessage(context, errMessage: 'Failed to log out');
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
          child: Icon(Icons.logout, color: AppColors.light, size: 32.sp),
        ),
        borderColor: AppColors.light,
        borderWidth: 3.w,
      ),
    );
  }
}
