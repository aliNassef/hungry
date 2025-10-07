import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/extensions/mediaquery_size.dart';
import 'package:hungry/core/extensions/padding_extension.dart';
import 'package:hungry/features/cart/presentation/widgets/cart_item.dart';
import '../widgets/total_price_and_checkout_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: context.height * .8,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              itemBuilder: (__, index) {
                return SizedBox(height: 200.h, child: CartItem());
              },
              separatorBuilder: (context, index) => Gap(24.h),
              itemCount: 5,
            ),
          ),
          Spacer(),
          TotalpriceAndCheckoutButton(),
          Gap(16.h),
        ],
      ).withHorizontalPadding(16.r),
    );
  }
}
