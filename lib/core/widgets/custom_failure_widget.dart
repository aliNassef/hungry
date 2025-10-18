import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../utils/app_styles.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Gap(100.h),
          Icon(Icons.error, color: Colors.red, size: 50),
          Gap(20.h),
          Text(
            '$message, please try again later.',
            style: AppStyles.regular16.copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
