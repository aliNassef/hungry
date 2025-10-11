import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hungry/core/navigation/app_navigation.dart';
import 'package:hungry/core/navigation/nav_animation_enum.dart';
import '../../../../core/navigation/nav_args.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../auth/presentation/views/login_view.dart';
import '../widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = 'splashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      AppNavigation.pushNamed(
        context,
        LoginView.routeName,
        arguments: NavArgs(animation: NavAnimation.fade),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle().copyWith(
        statusBarColor: AppColors.primary,
        systemNavigationBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(child: SplashViewBody()),
    );
  }
}
