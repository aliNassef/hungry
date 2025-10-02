import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/cache_helper.dart';
import '../logging/app_logger.dart';
import '../logging/custom_bloc_observer.dart';

class AppInitializer {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = CustomBlocObserver();
    CacheHelper.init();
    await ScreenUtil.ensureScreenSize();
    AppLogger.info("Hungry App Started ✅");
  }
}
