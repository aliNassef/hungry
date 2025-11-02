import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../cart/data/models/order_model.dart';
import '../controller/checkout_cubit/checkout_cubit.dart';
import '../widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.order});
  static const routeName = 'checkout';

  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    AppLogger.debug('order: ${order.items.first.quantity}');
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => injector<CheckoutCubit>(),
          child: CheckoutViewBody(order: order),
        ),
      ),
    );
  }
}
