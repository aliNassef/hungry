import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CustomizeYourMealTextWidget extends StatelessWidget {
  const CustomizeYourMealTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Customize ',
            style: AppStyles.semiBold16.copyWith(
              color: AppColors.brown,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'Your Burger to Your Tastes. Ultimate Experience.',
            style: AppStyles.regular14.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
