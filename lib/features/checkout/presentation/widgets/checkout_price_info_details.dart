import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/extensions/padding_extension.dart';
import 'package:hungry/core/utils/app_colors.dart';
import 'package:hungry/core/utils/app_styles.dart';

class CheckoutPriceInfoDetails extends StatelessWidget {
  const CheckoutPriceInfoDetails({
    super.key,
    required this.desc,
    required this.price,
  });
  final String desc, price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          desc,
          style: AppStyles.semiBold16.copyWith(
            fontSize: 18.sp,
            color: AppColors.lightGrey,
          ),
        ),
        const Spacer(),
        Text(
          price,
          style: AppStyles.semiBold16.copyWith(
            fontSize: 18.sp,
            color: AppColors.lightGrey,
          ),
        ),
      ],
    ).withHorizontalPadding(10.r);
  }
}
