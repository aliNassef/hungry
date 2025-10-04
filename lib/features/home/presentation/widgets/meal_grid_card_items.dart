import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'meal_item.dart';

class MealGridCardItems extends StatelessWidget {
  const MealGridCardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemBuilder: (__, index) {
        return FadeInLeft(
          animate: true,
          delay: Duration(milliseconds: 100 * index),
          duration: Duration(milliseconds: 300),
          child: MealCardItem(),
        );
      },
      itemCount: 10,
    );
  }
}
