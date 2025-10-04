import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hungry?',
              style: GoogleFonts.luckiestGuy(
                fontSize: 50.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w400,
              ),

              textAlign: TextAlign.center,
            ),
            Transform.translate(
              offset: const Offset(0, -10),
              child: Text(
                'Hello, Ali Nassef',
                style: AppStyles.medium18.copyWith(color: AppColors.lightGrey),
              ),
            ),
          ],
        ),
        Spacer(),
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: Image.asset(AppImages.splashBurger),
        ),
      ],
    );
  }
}
