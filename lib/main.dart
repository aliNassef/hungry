import 'package:flutter/material.dart';
import 'package:hungry/hungry_app.dart';

import 'core/utils/app_initializer.dart';

void main() async {
  await AppInitializer.init();
  runApp(const HungryApp());
}
