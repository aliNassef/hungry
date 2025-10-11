import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class AnotherWaySigning extends StatelessWidget {
  const AnotherWaySigning({
    super.key,
    required this.content,
    required this.action,
    this.onTap,
  });
  final String content, action;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: content,
            style: AppStyles.regular16.copyWith(color: AppColors.light),
            children: [
              TextSpan(
                text: action,
                style: AppStyles.regular16.copyWith(color: AppColors.light),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
