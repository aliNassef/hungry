import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hungry/core/utils/app_colors.dart';

abstract class AppDilagos {
  static void showToast({required String text}) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColors.primary,
      textColor: Colors.white,
      fontSize: 12.sp,
    );
  }
  
}
