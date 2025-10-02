import 'package:flutter/material.dart';

class AppShadwo {
  static final boxShadwo = BoxShadow(
    color: Color(0xFF000000).withValues(alpha: .13),
    offset: Offset(0, 6),
    blurRadius: 17,
    blurStyle: BlurStyle.outer,
    spreadRadius: 0,
  );
}
