import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/logging/app_logger.dart';
import 'package:hungry/features/home/presentation/controller/get_toppings_and_side_optionscubit/get_toppings_and_side_options_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../data/models/topping_model.dart';
import 'topping.dart';

class ToppingsListItems extends StatelessWidget {
  const ToppingsListItems({super.key, required this.toppings});
  final ValueNotifier<List<int>> toppings;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetToppingsAndSideOptionsCubit,
      GetToppingsAndSideOptionsState
    >(
      buildWhen: (previous, current) =>
          current is GetToppingsLoaded ||
          current is GetSideOptionsLoading ||
          current is GetToppingsError,
      builder: (context, state) {
        if (state is GetToppingsError) {
          return CustomFailureWidget(message: state.errMessage);
        }
        if (state is GetSideOptionsLoading) {
          return Skeletonizer(
            enabled: true,
            child: SizedBox(
              height: 140.h,
              child: ListView.separated(
                itemCount: ToppingModel.dummy.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => Gap(8.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (__, index) => Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Topping(topping: ToppingModel.dummy[index]),
                ),
              ),
            ),
          );
        }
        if (state is GetToppingsLoaded) {
          return SizedBox(
            height: 140.h,
            child: ListView.separated(
              itemCount: state.toppings.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => Gap(8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (__, index) => Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Topping(
                  topping: state.toppings[index],
                  onTap: () {
                    if (toppings.value.contains(state.toppings[index].id)) {
                      toppings.value.remove(state.toppings[index].id);
                    } else {
                      toppings.value.add(state.toppings[index].id);
                    }
                    AppLogger.info('toppings : ${toppings.value}');
                  },
                ),
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
