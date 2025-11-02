import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/navigation/app_navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dilagos.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../controller/cubit/auth_cubit.dart';
import '../views/register_view.dart';
import '../../../layout/presentation/views/layout_view.dart';

import '../../../../core/navigation/nav_animation_enum.dart';
import '../../../../core/navigation/nav_args.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/logo_widget.dart';
import '../../data/models/login_input_model.dart';
import 'another_way_signing.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController _emailController, _passwordController;
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(40.h),
          const LogoWidget(),
          Text(
            'Welcome Back, Please Login',
            style: AppStyles.medium18.copyWith(color: AppColors.light),
          ),
          Gap(40.h),
          CustomTextFormField(
            controller: _emailController,
            label: 'Email',
            hint: 'Enter your email',
          ),
          Gap(40.h),
          CustomTextFormField(
            controller: _passwordController,
            isPassword: true,
            label: 'Password',
            hint: 'Enter your password',
            textInputAction: TextInputAction.done,
          ),
          Gap(40.h),
          _buildLoginBlocListner(),
          Gap(24.h),
          AnotherWaySigning(
            action: 'Sign Up',
            content: 'Don\'t have an account? ',
            onTap: () => AppNavigation.pushNamed(
              context,
              RegisterView.routeName,
              arguments: const NavArgs(animation: NavAnimation.fade),
            ),
          ),
        ],
      ),
    );
  }

  BlocListener<AuthCubit, AuthState> _buildLoginBlocListner() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthFailure ||
          current is AuthSuccess ||
          current is AuthLoading,
      listener: (context, state) {
        if (state is AuthLoading) {
          AppDilagos.showLoadingBox(context);
        }
        if (state is AuthFailure) {
          AppNavigation.pop(context);
          AppDilagos.showErrorMessage(context, errMessage: state.errMessage);
        }
        if (state is AuthSuccess) {
          AppNavigation.pop(context);
          AppNavigation.pushAndRemoveUntil(
            context,
            LayoutView.routeName,
            (route) => false,
            arguments: const NavArgs(animation: NavAnimation.fade),
          );
          AppDilagos.showToast(text: 'Login Success');
        }
      },
      child: DefaultAppButton(
        text: 'Login',
        icon: Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Icon(Icons.login, color: AppColors.primary, size: 24.sp),
        ),
        backgroundColor: AppColors.light,
        textColor: AppColors.primary,
        onPressed: _login,
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var loginInputModel = LoginInputModel(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      AppLogger.info(loginInputModel.toString());
      context.read<AuthCubit>().login(loginInputModel);
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
