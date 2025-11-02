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
    this.textInputAction = TextInputAction.next,
  });

  final bool isPassword;
  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _showVisobility;
  @override
  void initState() {
    super.initState();
    _showVisobility = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      onEditingComplete: () {
        if (widget.textInputAction == TextInputAction.done) {
          FocusManager.instance.primaryFocus?.unfocus();
        } else {
          FocusScope.of(context).nextFocus();
        }
      },
      controller: widget.controller,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "Please enter ${widget.label.toLowerCase()}";
        }
        return null;
      },
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      cursorColor: AppColors.light,
      style: AppStyles.semiBold16.copyWith(color: AppColors.light),
      obscureText: widget.isPassword && _showVisobility,
      decoration: InputDecoration(
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _showVisobility = !_showVisobility;
                  });
                },
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
