import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.isPassword = false,
  });

  final bool isPassword;
  final String label;
  final String hint;
  final TextEditingController? controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final bool _showVisobility = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      cursorColor: AppColors.light,
      style: AppStyles.semiBold16.copyWith(color: AppColors.light),
      obscureText: widget.isPassword,
      decoration: InputDecoration(
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {},
                child: Icon(
                  _showVisobility
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  color: AppColors.light,
                ),
              )
            : null,
        hintText: widget.hint,
        hintStyle: AppStyles.regular14.copyWith(color: AppColors.light),
        labelStyle: AppStyles.medium16.copyWith(color: AppColors.light),
        border: _buildBorderTextForm(),
        enabledBorder: _buildBorderTextForm(),
        focusedBorder: _buildBorderTextForm(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      ),
    );
  }

  OutlineInputBorder _buildBorderTextForm() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(color: AppColors.light, width: 2.w),
    );
  }
}
