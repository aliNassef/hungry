import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/extensions/padding_extension.dart';

import '../widgets/category_home_list.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/meal_grid_card_items.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: FadeInRight(child: HomeTopBar().withHorizontalPadding(16)),
        ),
        SliverGap(17.h),
        SliverToBoxAdapter(child: FadeInDown(child: CustomSearchBar())),
        SliverGap(40),
        SliverToBoxAdapter(child: CategoryHomeList()),
        SliverGap(40),
        SliverPadding(
          padding: EdgeInsets.all(16.r),
          sliver: MealGridCardItems(),
        ),
      ],
    );
  }
}
