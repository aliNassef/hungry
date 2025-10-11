import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/di/service_locator.dart';
import 'package:hungry/core/extensions/padding_extension.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/features/auth/presentation/controller/cubit/auth_cubit.dart';

import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocProvider(
        create: (context) => injector<AuthCubit>(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: LoginViewBody(),
          ).withHorizontalPadding(16.w),
        ),
      ),
    );
  }
}
