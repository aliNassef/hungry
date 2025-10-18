import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/utils/app_colors.dart';
import 'hungry_app.dart';
import 'core/utils/app_initializer.dart';

void main() async {
  await AppInitializer.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle().copyWith(
      statusBarColor: AppColors.primary,
      systemNavigationBarColor: AppColors.primary,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const HungryApp()));
}
