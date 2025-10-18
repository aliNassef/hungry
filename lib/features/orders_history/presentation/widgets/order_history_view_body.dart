import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/orders_history/presentation/controller/get_order_history_cubit/get_orders_history_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/custom_failure_widget.dart';
import '../../data/models/order_history_model.dart';
import 'order_history_item.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersHistoryCubit, GetOrdersHistoryState>(
      buildWhen: (previous, current) =>
          current is GetOrdersHistoryLoaded ||
          current is GetOrdersHistoryLoading ||
          current is GetOrdersHistoryFailure,
      builder: (context, state) {
        if (state is GetOrdersHistoryFailure) {
          return CustomFailureWidget(message: state.errMessage);
        }
        if (state is GetOrdersHistoryLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.separated(
              itemCount: OrderHistoryModel.dummy.length,
              separatorBuilder: (context, index) => Gap(10.h),
              itemBuilder: (context, index) =>
                  OrderHistoryItem(order: OrderHistoryModel.dummy[index]),
            ),
          );
        }

        if (state is GetOrdersHistoryLoaded) {
          final orders = state.orders;
          if (orders.isEmpty) {
            return Center(
              child: Text(
                'No orders found',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            );
          }
          return ListView.separated(
            itemCount: orders.length,
            separatorBuilder: (context, index) => Gap(10.h),
            itemBuilder: (context, index) =>
                OrderHistoryItem(order: orders[index]),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
