import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CustomizeYourMealTextWidget extends StatelessWidget {
  const CustomizeYourMealTextWidget({
    super.key,
    required this.name,
    required this.desc,
  });
  final String name;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: name,
            style: AppStyles.semiBold16.copyWith(
              color: AppColors.brown,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: ': \n',
            style: AppStyles.regular14.copyWith(color: AppColors.grey),
          ),
          TextSpan(
            text: desc,
            style: AppStyles.regular14.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
