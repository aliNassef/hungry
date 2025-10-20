import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class IncrementAndDecrementButton extends StatefulWidget {
  const IncrementAndDecrementButton({super.key});

  @override
  State<IncrementAndDecrementButton> createState() =>
      _IncrementAndDecrementButtonState();
}

class _IncrementAndDecrementButtonState
    extends State<IncrementAndDecrementButton> {
  int count = 1;

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
            backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
          ),
          onPressed: () {
            if (count > 1) setState(() => count--);
          },
          icon: const Icon(FontAwesomeIcons.minus, color: AppColors.light),
        ),
        Text(
          count.toString(),
          style: AppStyles.medium18.copyWith(
            color: AppColors.brown,
            fontSize: 24.sp,
          ),
        ),
        IconButton.filled(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
          ),
          onPressed: () {
            setState(() => count++);
          },
          icon: const Icon(FontAwesomeIcons.plus, color: AppColors.light),
        ),
      ],
    );
  }
}
