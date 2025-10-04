import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.light,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        'aaaaaaaaa',
        style: AppStyles.medium16.copyWith(
          color: isActive ? Colors.white : AppColors.grey,
        ),
      ),
    );
  }
}
