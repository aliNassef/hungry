import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'category_item.dart';

class CategoryHomeList extends StatelessWidget {
  const CategoryHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (__, index) {
          return FadeInLeft(
            animate: true,
            delay: Duration(milliseconds: 100 * index),
            duration: Duration(milliseconds: 300),
            child: CategoryItem(isActive: true),
          );
        },
        separatorBuilder: (__, _) => Gap(10.w),
        itemCount: 10,
      ),
    );
  }
}
