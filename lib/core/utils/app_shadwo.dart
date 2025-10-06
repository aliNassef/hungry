import 'package:flutter/material.dart';

class AppShadwo {
  static final boxShadwo = BoxShadow(
    color: Color(0xFF000000).withValues(alpha: .13),
    offset: Offset(0, 6),
    blurRadius: 17,
    blurStyle: BlurStyle.outer,
    spreadRadius: 0,
  );

  static final boxShadwo2 = BoxShadow(
    color: Colors.black.withValues(alpha: 0.25),
    spreadRadius: 2,
    blurRadius: 10,
    offset: const Offset(0, 5),
  );
}
