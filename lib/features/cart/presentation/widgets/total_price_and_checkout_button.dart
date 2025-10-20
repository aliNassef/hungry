import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/navigation/app_navigation.dart';
import 'package:hungry/features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:hungry/features/cart/presentation/view/checkout_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
            BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) =>
                  current is CartLoaded ||
                  current is CartLoaded ||
                  current is CartError,
              builder: (context, state) {
                if (state is CartLoaded) {
                  return Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\$',
                          style: AppStyles.regular22.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(
                          text: '${state.orderModel.totalPrice}',
                          style: AppStyles.regular22.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is CartError) {
                  return const SizedBox.shrink();
                }
                if (state is CartLoading) {
                  return Skeletonizer(
                    enabled: true,
                    child: Text.rich(
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
                            style: AppStyles.regular22.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
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
      arguments: const NavArgs(animation: NavAnimation.fade),
      useAppRoute: true,
    );
  }
}
