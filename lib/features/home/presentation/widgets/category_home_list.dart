import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/logging/app_logger.dart';
import '../../data/models/category_model.dart';
import '../controller/get_categories_cubit/get_categories_cubit.dart';
import '../controller/get_products_cubit/get_products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/custom_failure_widget.dart';
import 'category_item.dart';

class CategoryHomeList extends StatelessWidget {
  const CategoryHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      buildWhen: (previous, current) =>
          current is GetCategoriesLoaded ||
          current is GetCategoriesLoading ||
          current is GetCategoriesError,
      builder: (context, state) {
        if (state is GetCategoriesError) {
          AppLogger.error(state.errMessage);
          return CustomFailureWidget(
            message: state.errMessage,
          ).withHorizontalPadding(16);
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
                    duration: const Duration(milliseconds: 300),
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
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: () {
                      context.read<GetCategoriesCubit>().selectCategoryIndex(
                        index,
                      );
                      if (index == 0) {
                        context.read<GetProductsCubit>().getProducts();
                        return;
                      }
                      context.read<GetProductsCubit>().getProducts(
                        categoryId: state.categories[index].id.toString(),
                      );
                    },
                    child: CategoryItem(
                      isActive: index == state.selectedCategoryIndex,
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
