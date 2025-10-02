import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry/core/extensions/mediaquery_size.dart';

import '../../../../core/utils/app_assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Text(
          'Hungry?',
          style: GoogleFonts.luckiestGuy(
            fontSize: 60.sp,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        Image.asset(
          AppImages.splashBurger,
          height: context.height * 1 / 3,
          width: context.width,
        ),
      ],
    );
  }
}
