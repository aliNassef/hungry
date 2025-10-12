import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$message, please try again later.',
        style: AppStyles.bold24.copyWith(color: Colors.red),
      ),
    );
  }
}
