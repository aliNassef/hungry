import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../controller/get_products_cubit/get_products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/meal_model.dart';
import 'meal_item.dart';

class MealGridCardItems extends StatelessWidget {
  const MealGridCardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      buildWhen: (previous, current) =>
          current is GetProductsLoaded ||
          current is GetProductsLoading ||
          current is GetProductsError,
      builder: (context, state) {
        if (state is GetProductsError) {
          return CustomFailureWidget(message: state.errMessage);
        }

        if (state is GetProductsLoading) {
          return SliverSkeletonizer(
            enabled: true,
            child: SliverGrid.builder(
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
                  child: MealCardItem(meal: MealModel.dummy[index]),
                );
              },
              itemCount: MealModel.dummy.length,
            ),
          );
        }

        if (state is GetProductsLoaded) {
          if (state.meals.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.fastfood, size: 64.sp, color: Colors.grey),
                      SizedBox(height: 16.h),
                      Text(
                        'No meals available now',
                        style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemBuilder: (__, index) {
              final meal = state.meals[index];
              return FadeInLeft(
                animate: true,
                delay: Duration(milliseconds: 100 * index),
                duration: Duration(milliseconds: 300),
                child: MealCardItem(meal: meal),
              );
            },
            itemCount: state.meals.length,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
