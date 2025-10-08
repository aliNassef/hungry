import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/navigation/app_navigation.dart';
import 'package:hungry/features/cart/presentation/view/checkout_view.dart';

import '../../../../core/navigation/nav_animation_enum.dart';
import '../../../../core/navigation/nav_args.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/default_app_button.dart';

class TotalpriceAndCheckoutButton extends StatelessWidget {
  const TotalpriceAndCheckoutButton({super.key});

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
          child: DefaultAppButton(
            text: 'Checkout',
            onPressed: () {
              _goToCheckout(context);
            },
          ),
        ),
      ],
    );
  }

  _goToCheckout(context) {
    AppNavigation.pushNamed(
      context,
      CheckoutView.routeName,
      arguments: NavArgs(animation: NavAnimation.fade),
      useAppRoute: true,
    );
  }
}
