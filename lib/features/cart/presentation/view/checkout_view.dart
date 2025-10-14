import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_styles.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/default_app_button.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = 'checkout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: CheckoutViewBody()));
  }
}

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16.h),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Icon(Icons.arrow_back_ios_new),
        ),
        Gap(16.h),

        Text(
          'Order summary',
          style: AppStyles.semiBold16.copyWith(
            fontSize: 20.sp,
            color: AppColors.brown,
          ),
        ),
        Gap(20.h),
        CheckoutPriceInfoDetails(desc: 'Order', price: '\$16.48'),
        CheckoutPriceInfoDetails(desc: 'Taxes', price: '\$16.48'),
        CheckoutPriceInfoDetails(desc: 'Delivery fees', price: '\$16.48'),
        Gap(9.h),
        Divider(indent: 16.w, endIndent: 16.w, color: Color(0xffF0F0F0)),
        Gap(9.h),
        Row(
          children: [
            Text(
              'Total:',
              style: AppStyles.semiBold16.copyWith(
                fontSize: 18.sp,
                color: AppColors.brown,
              ),
            ),
            Spacer(),
            Text(
              '\$18.19',
              style: AppStyles.semiBold16.copyWith(
                fontSize: 18.sp,
                color: AppColors.brown,
              ),
            ),
          ],
        ).withHorizontalPadding(10.r),
        Gap(16.h),
        Row(
          children: [
            Text(
              'Estimated delivery time:',
              style: AppStyles.semiBold16.copyWith(
                fontSize: 14.sp,
                color: AppColors.brown,
              ),
            ),
            Spacer(),
            Text(
              '15 - 30 mins',
              style: AppStyles.semiBold16.copyWith(
                fontSize: 14.sp,
                color: AppColors.brown,
              ),
            ),
          ],
        ).withHorizontalPadding(10.r),
        Spacer(),
        DefaultAppButton(text: 'Pay now', onPressed: () {}),
        Gap(30.h),
      ],
    ).withHorizontalPadding(16);
  }
}

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
        Spacer(),
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
