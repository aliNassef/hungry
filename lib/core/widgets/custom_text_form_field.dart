import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hint,
  });
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      cursorColor: AppColors.light,
      style: AppStyles.semiBold16.copyWith(color: AppColors.light),
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,

        hintText: hint,
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
