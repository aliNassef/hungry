import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/di/service_locator.dart';
import 'package:hungry/core/utils/app_theme.dart';
import 'package:hungry/features/splash/presentation/controller/splash_cubit/splash_cubit.dart';
import 'core/navigation/app_routes.dart';
import 'features/splash/presentation/view/splash_view.dart';

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<SplashCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        child: MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: SplashView.routeName,
        ),
      ),
    );
  }
}
