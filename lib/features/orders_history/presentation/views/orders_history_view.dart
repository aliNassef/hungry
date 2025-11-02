import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../controller/get_order_history_cubit/get_orders_history_cubit.dart';

import '../widgets/order_history_view_body.dart';

class OrdersHistoryView extends StatelessWidget {
  const OrdersHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          injector<GetOrdersHistoryCubit>()..getOrdersHistory(),
      child: const SafeArea(child: OrderHistoryViewBody()),
    );
  }
}
