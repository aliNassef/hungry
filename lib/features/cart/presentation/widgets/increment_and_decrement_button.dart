import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controller/cart_cubit/cart_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class IncrementAndDecrementButton extends StatefulWidget {
  const IncrementAndDecrementButton({
    super.key,
    required this.quatity,
    required this.id,
  });
  final int quatity;
  final int id;
  @override
  State<IncrementAndDecrementButton> createState() =>
      _IncrementAndDecrementButtonState();
}

class _IncrementAndDecrementButtonState
    extends State<IncrementAndDecrementButton> {
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quatity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.filled(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
          ),
          onPressed: onDecrement,
          icon: const Icon(FontAwesomeIcons.minus, color: AppColors.light),
        ),
        Text(
          _quantity.toString(),
          style: AppStyles.medium18.copyWith(
            color: AppColors.brown,
            fontSize: 24.sp,
          ),
        ),
        IconButton.filled(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
          ),
          onPressed: onIncrement,
          icon: const Icon(FontAwesomeIcons.plus, color: AppColors.light),
        ),
      ],
    );
  }

  void onIncrement() {
    _quantity++;
    context.read<CartCubit>().updateQuanitiy(widget.id, _quantity);
  }

  void onDecrement() {
    if (_quantity > 1) _quantity--;
    context.read<CartCubit>().updateQuanitiy(widget.id, _quantity);
  }
}
