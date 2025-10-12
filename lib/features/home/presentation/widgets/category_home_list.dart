import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/data/models/category_model.dart';
import 'package:hungry/features/home/presentation/controller/get_categories_cubit/get_categories_cubit.dart';
import 'package:hungry/features/home/presentation/controller/get_products_cubit/get_products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/custom_failure_widget.dart';
import 'category_item.dart';

class CategoryHomeList extends StatefulWidget {
  const CategoryHomeList({super.key});

  @override
  State<CategoryHomeList> createState() => _CategoryHomeListState();
}

class _CategoryHomeListState extends State<CategoryHomeList> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      buildWhen: (previous, current) =>
          current is GetCategoriesLoaded ||
          current is GetCategoriesLoading ||
          current is GetCategoriesError,
      builder: (context, state) {
        if (state is GetCategoriesError) {
          return CustomFailureWidget(message: state.errMessage);
        }
        if (state is GetCategoriesLoading) {
          return Skeletonizer(
            enabled: true,
            ignoreContainers: false,
            containersColor: Colors.grey.shade300,
            child: SizedBox(
              height: 50.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (__, index) {
                  return FadeInLeft(
                    animate: true,
                    delay: Duration(milliseconds: 100 * index),
                    duration: Duration(milliseconds: 300),
                    child: CategoryItem(
                      isActive: true,
                      category: CategoryModel.dummy[index],
                    ),
                  );
                },
                separatorBuilder: (__, _) => Gap(10.w),
                itemCount: CategoryModel.dummy.length,
              ),
            ),
          );
        }
        if (state is GetCategoriesLoaded) {
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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                      if (index == 0) {
                        context.read<GetProductsCubit>().getProducts();
                        return;
                      }
                      context.read<GetProductsCubit>().getProducts(
                        categoryId: state.categories[index].id.toString(),
                      );
                    },
                    child: CategoryItem(
                      isActive: index == _currentIndex,
                      category: state.categories[index],
                    ),
                  ),
                );
              },
              separatorBuilder: (__, _) => Gap(10.w),
              itemCount: state.categories.length,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
