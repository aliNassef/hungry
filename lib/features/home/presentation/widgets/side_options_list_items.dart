import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/presentation/controller/get_toppings_and_side_optionscubit/get_toppings_and_side_options_cubit.dart';
import 'package:hungry/features/home/presentation/widgets/side_options.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../data/models/slide_option_model.dart';

class SideOptionsListItems extends StatelessWidget {
  const SideOptionsListItems({super.key, required this.sideOptions});
  final ValueNotifier<List<int>> sideOptions;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetToppingsAndSideOptionsCubit,
      GetToppingsAndSideOptionsState
    >(
      buildWhen: (previous, current) =>
          current is GetSideOptionsLoaded ||
          current is GetSideOptionsLoading ||
          current is GetSideOptionsError,
      builder: (context, state) {
        if (state is GetSideOptionsError) {
          return CustomFailureWidget(message: state.errMessage);
        }
        if (state is GetSideOptionsLoading) {
          return Skeletonizer(
            enabled: true,
            child: SizedBox(
              height: 140.h,
              child: ListView.separated(
                itemCount: SlideOptionModel.dummy.length,
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
                  child: SideOption(sideOption: SlideOptionModel.dummy[index]),
                ),
              ),
            ),
          );
        }
        if (state is GetSideOptionsLoaded) {
          return SizedBox(
            height: 140.h,
            child: ListView.separated(
              itemCount: state.sideOptions.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => Gap(8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (__, index) => Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: SideOption(
                  sideOption: state.sideOptions[index],
                  onTap: () {
                    if (sideOptions.value.contains(
                      state.sideOptions[index].id,
                    )) {
                      sideOptions.value.remove(state.sideOptions[index].id);
                    } else {
                      sideOptions.value.add(state.sideOptions[index].id);
                    }
                    AppLogger.info(
                      'Selected Side Options: ${sideOptions.value.toString()}',
                    );
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
