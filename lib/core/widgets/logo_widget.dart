import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.size = 60});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hungry?',
      style: GoogleFonts.luckiestGuy(
        fontSize: size.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }
}
