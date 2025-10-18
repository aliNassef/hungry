import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/widgets/custom_network_image.dart';

class OrdersHistoryView extends StatelessWidget {
  const OrdersHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => Gap(10.h),
      itemBuilder: (context, index) => OrderHistoryItem(),
    );
  }
}

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Gap(10.h),
          CustomNetworkImage(img: 'https://i.ibb.co/2M1R7rD/Rectangle-1.png'),
        ],
      ),
    );
  }
}
