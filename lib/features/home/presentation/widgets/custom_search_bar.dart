import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_shadwo.dart';
import '../../../../core/utils/app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [AppShadwo.boxShadwo, AppShadwo.boxShadwo],
      ),
      child: TextField(
        cursorColor: AppColors.primary,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.r),
          border: _buildBorderSearch(),
          enabledBorder: _buildBorderSearch(),
          focusedBorder: _buildBorderSearch(),
          prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search',
          hintStyle: AppStyles.medium14.copyWith(color: AppColors.grey),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorderSearch() {
    return OutlineInputBorder(
      gapPadding: 0,
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide.none,
    );
  }
}
