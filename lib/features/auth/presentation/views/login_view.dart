import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/utils/app_styles.dart';
import 'package:hungry/core/widgets/custom_text_form_field.dart';

import '../../../../core/widgets/logo_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: LoginViewBody())),
    );
  }
}

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LogoWidget(),
        Text(
          'Welcome Back, Please Login',
          style: AppStyles.medium18.copyWith(color: AppColors.light),
        ),
        CustomTextFormField(
          label: 'Email', hint: 'Enter your email'),
        CustomTextFormField(label: 'Password', hint: 'Enter your password'),
      ],
    );
  }
}

// https://sonic-zdi0.onrender.com/api
