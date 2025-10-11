import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/di/service_locator.dart';
import 'package:hungry/core/utils/app_colors.dart';

import '../helpers/cache_helper.dart';
import '../logging/app_logger.dart';
import '../logging/custom_bloc_observer.dart';

class AppInitializer {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = CustomBlocObserver();
    await CacheHelper.init();
    setupServiceLocator();
    await ScreenUtil.ensureScreenSize();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle().copyWith(
        statusBarColor: AppColors.primary,
        systemNavigationBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    AppLogger.info("Hungry App Started ✅");
  }
}
