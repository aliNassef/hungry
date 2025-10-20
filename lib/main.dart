import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hungry_app.dart';
import 'core/utils/app_initializer.dart';

void main() async {
  await AppInitializer.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const HungryApp()));
}
