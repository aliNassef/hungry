import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/di/service_locator.dart';
import 'package:hungry/core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../controller/cubit/auth_cubit.dart';
import '../widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = 'register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocProvider(
        create: (context) => injector<AuthCubit>(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: RegisterViewBody(),
          ).withHorizontalPadding(16.w),
        ),
      ),
    );
  }
}
