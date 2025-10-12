import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_shadwo.dart';
import 'package:hungry/core/utils/app_styles.dart';
import 'package:hungry/core/widgets/custom_network_image.dart';
import 'package:hungry/features/home/data/models/slide_option_model.dart';
import '../../../../core/utils/app_colors.dart';

class SideOption extends StatefulWidget {
  const SideOption({super.key, required this.sideOption, this.onTap});
  final SlideOptionModel sideOption;
  final void Function()? onTap;

  @override
  State<SideOption> createState() => _SideOptionState();
}

class _SideOptionState extends State<SideOption> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100.h,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xFF3A2E2E),
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [AppShadwo.boxShadwo2],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.sideOption.name,
                        style: AppStyles.medium12.copyWith(
                          color: AppColors.light,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.onTap?.call();
                          setState(() {
                            isActive = !isActive;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: isActive ? AppColors.red : AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isActive ? Icons.remove : Icons.add,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 10.h,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
                boxShadow: [AppShadwo.boxShadwo2],
              ),
              child: CustomNetworkImage(
                img: widget.sideOption.image,
                width: 140.w,
                height: 60.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
