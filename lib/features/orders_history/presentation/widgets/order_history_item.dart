import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/extensions/date_time_extension.dart';
import 'package:hungry/core/utils/app_styles.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../data/models/order_history_model.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({super.key, required this.order});
  final OrderHistoryModel order;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior:
          Clip.antiAlias, // Clips the image to the card's border radius
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Center(
            child: CustomNetworkImage(
              img: order.productImage,
              height: 200.h,
              width: 200.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row for Order ID and Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order #${order.id}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Chip(
                      label: Text(
                        order.status,
                        style: AppStyles.regular20.copyWith(
                          color: AppColors.light,
                        ),
                      ),
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                  ],
                ),
                const Gap(12),
                // Row for Total Price
                Row(
                  children: [
                    Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      'Total Price: \$${order.totalPrice}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Gap(8.w),

                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      'Date: ${DateTime.parse(order.createdAt).format('dd MMM, yyyy')}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
