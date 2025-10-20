import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../controller/get_categories_cubit/get_categories_cubit.dart';
import '../controller/get_products_cubit/get_products_cubit.dart';
import '../widgets/category_home_list.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/meal_grid_card_items.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      context.read<GetCategoriesCubit>().getCategories(),
      context.read<GetProductsCubit>().getProducts(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: FadeInRight(
            child: const HomeTopBar().withHorizontalPadding(16),
          ),
        ),
        SliverGap(17.h),
        SliverToBoxAdapter(child: FadeInDown(child: const CustomSearchBar())),
        const SliverGap(40),
        const SliverToBoxAdapter(child: CategoryHomeList()),
        const SliverGap(40),
        SliverPadding(
          padding: EdgeInsets.all(16.r),
          sliver: const MealGridCardItems(),
        ),
      ],
    );
  }
}
