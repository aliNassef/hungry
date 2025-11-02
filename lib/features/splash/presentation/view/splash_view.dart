import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/navigation/app_navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../auth/presentation/views/login_view.dart';
import '../../../layout/presentation/views/layout_view.dart';
import '../controller/splash_cubit/splash_cubit.dart';
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
    _timer = Timer(const Duration(seconds: 3), () async {
      context.read<SplashCubit>().checkAuth();
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
      body: BlocListener<SplashCubit, SplashState>(
        listenWhen: (previous, current) =>
            current is Authenticated || current is UnAuthenticated,
        listener: (context, state) {
          if (state is Authenticated) {
            AppNavigation.pushAndRemoveUntil(
              context,
              LayoutView.routeName,
              (route) => false,
            );
          } else if (state is UnAuthenticated) {
            AppNavigation.pushAndRemoveUntil(
              context,
              LoginView.routeName,
              (route) => false,
            );
          }
        },
        child: const SafeArea(bottom: false, child: SplashViewBody()),
      ),
    );
  }
}
