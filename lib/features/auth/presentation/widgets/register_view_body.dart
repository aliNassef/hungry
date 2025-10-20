import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/helpers/image_picker_helper.dart';
import '../../../../core/navigation/nav_animation_enum.dart';
import '../../../../core/navigation/nav_args.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../controller/cubit/auth_cubit.dart';
import '../views/login_view.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/navigation/app_navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dilagos.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/logo_widget.dart';
import '../../../layout/presentation/views/layout_view.dart';
import '../../data/models/register_input_model.dart';
import 'another_way_signing.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late TextEditingController _emailController,
      _passwordController,
      _phoneController,
      _nameController;
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;
  File? _image;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _nameController = TextEditingController();
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
            'Create Account',
            style: AppStyles.medium18.copyWith(color: AppColors.light),
          ),
          Gap(40.h),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                ImagePickerHelper().pickImage(source: ImageSource.gallery).then(
                  (value) {
                    setState(() {
                      _image = value;
                    });
                  },
                );
              },
              child: CircleAvatar(
                radius: 65.r,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                backgroundColor: AppColors.light,
                child: _image != null
                    ? null
                    : Icon(Icons.person, size: 50.sp, color: AppColors.primary),
              ),
            ),
          ),
          Gap(32.h),
          CustomTextFormField(
            controller: _nameController,
            label: 'Name',
            hint: 'Enter your name',
          ),
          Gap(40.h),
          CustomTextFormField(
            controller: _emailController,
            label: 'Email',
            hint: 'Enter your email',
          ),
          Gap(40.h),
          CustomTextFormField(
            controller: _phoneController,
            label: 'Phone Number',
            hint: 'Enter your phone number',
          ),
          Gap(40.h),
          CustomTextFormField(
            controller: _passwordController,
            isPassword: true,
            label: 'Password',
            hint: 'Enter your password',
          ),
          Gap(40.h),
          _buildRegisterBuutoonBlocListener(context),
          Gap(24.h),
          AnotherWaySigning(
            action: 'Login',
            content: 'Already have an account? ',
            onTap: () => AppNavigation.pushNamed(
              context,
              LoginView.routeName,
              arguments: const NavArgs(animation: NavAnimation.fade),
            ),
          ),
          Gap(32.h),
        ],
      ),
    );
  }

  BlocListener<AuthCubit, AuthState> _buildRegisterBuutoonBlocListener(
    BuildContext context,
  ) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthLoading ||
          current is AuthFailure ||
          current is AuthSuccess,
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
          AppDilagos.showToast(text: 'Register Success');
        }
      },
      child: DefaultAppButton(
        text: 'Sign up',
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            var registerInputModel = RegisterInputModel(
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
              phoneNumber: _phoneController.text.trim(),
              image: _image,
            );

            context.read<AuthCubit>().register(registerInputModel);
          } else {
            setState(() {
              _autovalidateMode = AutovalidateMode.always;
            });
          }
        },
        backgroundColor: AppColors.light,
        textColor: AppColors.primary,
        icon: Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Icon(Icons.login, color: AppColors.primary, size: 24.sp),
        ),
      ),
    );
  }
}
