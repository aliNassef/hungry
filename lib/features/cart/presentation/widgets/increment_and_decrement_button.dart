import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class IncrementAndDecrementButton extends StatelessWidget {
  const IncrementAndDecrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.filled(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            backgroundColor: WidgetStatePropertyAll(AppColors.primary),
          ),
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.minus, color: AppColors.light),
        ),
        Text('1', style: AppStyles.medium18.copyWith(color: AppColors.brown)),
        IconButton.filled(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            backgroundColor: WidgetStatePropertyAll(AppColors.primary),
          ),
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.plus, color: AppColors.light),
        ),
      ],
    );
  }
}
