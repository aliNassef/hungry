import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/default_app_button.dart';

class TotalPriceAndAddToCart extends StatelessWidget {
  const TotalPriceAndAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total',
              style: AppStyles.semiBold16.copyWith(
                color: AppColors.brown,
                fontSize: 18.sp,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '\$',
                    style: AppStyles.regular22.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: '2000',
                    style: AppStyles.regular22.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(16.w),
        Expanded(
          child: DefaultAppButton(text: 'Add to Cart', onPressed: () {}),
        ),
      ],
    );
  }
}
