import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key, required this.spicyValue});
  final ValueNotifier<double> spicyValue;
  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  double _spicinessLevel = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spicy',
          style: AppStyles.medium14.copyWith(color: AppColors.brown),
        ),
        Gap(10.h),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: const Color(0xFFD8D8D8),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0.r),
            thumbColor: AppColors.primary,
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
            overlayColor: const Color(0xFF00695C).withValues(alpha: 0.2),
          ),
          child: Slider(
            value: _spicinessLevel,
            min: 0,
            max: 100,
            onChanged: (double value) {
              setState(() {
                _spicinessLevel = value;
              });
              widget.spicyValue.value = value / 100;
            },
          ),
        ),
        Gap(8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('🥶', style: AppStyles.medium16),
            Text('🌶️', style: AppStyles.medium16),
          ],
        ),
      ],
    ).withHorizontalPadding(16.w);
  }
}
