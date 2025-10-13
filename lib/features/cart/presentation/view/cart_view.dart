import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/extensions/mediaquery_size.dart';
import 'package:hungry/core/extensions/padding_extension.dart';
import 'package:hungry/core/widgets/custom_failure_widget.dart';
import 'package:hungry/features/cart/data/models/order_model.dart';
import 'package:hungry/features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:hungry/features/cart/presentation/widgets/cart_item.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../widgets/total_price_and_checkout_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) =>
                current is CartLoading ||
                current is CartError ||
                current is CartLoaded,
            builder: (context, state) {
              if (state is CartLoading) {
                return Skeletonizer(
                  enabled: true,
                  child: SizedBox(
                    height: context.height * .8,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      itemBuilder: (__, index) {
                        return SizedBox(
                          height: 200.h,
                          child: CartItem(
                            orderItem: OrderModel.dummy.items[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Gap(24.h),
                      itemCount: OrderModel.dummy.items.length,
                    ),
                  ),
                );
              } else if (state is CartError) {
                return CustomFailureWidget(message: state.errMessage);
              } else if (state is CartLoaded) {
                if (state.orderModel.items.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        'Your cart is empty',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  );
                }

                return SizedBox(
                  height: context.height * .8,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    itemBuilder: (__, index) {
                      return SizedBox(
                        height: 200.h,
                        child: CartItem(
                          orderItem: state.orderModel.items[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Gap(24.h),
                    itemCount: state.orderModel.items.length,
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
          Spacer(),
          TotalpriceAndCheckoutButton(),
          Gap(16.h),
        ],
      ).withHorizontalPadding(16.r),
    );
  }
}
