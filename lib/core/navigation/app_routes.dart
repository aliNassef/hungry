import 'package:flutter/material.dart';
import '../../features/home/data/models/meal_model.dart';
import '../../features/splash/presentation/view/splash_view.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/cart/presentation/view/checkout_view.dart';
import '../../features/home/presentation/view/meal_details_view.dart';
import '../../features/layout/presentation/views/layout_view.dart';
import 'nav_animation_enum.dart';
import 'nav_args.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final navArgs = args is NavArgs ? args : const NavArgs(data: null);

    late final Widget page;
    switch (settings.name) {
      case SplashView.routeName:
        page = const SplashView();
        break;
      case LayoutView.routeName:
        page = const LayoutView();
        break;
      case MealDetailsView.routeName:
        final meal = navArgs.data as MealModel;
        page = MealDetailsView(meal: meal);
        break;
      case CheckoutView.routeName:
        page = const CheckoutView();
        break;
      case LoginView.routeName:
        page = const LoginView();
        break;
      case RegisterView.routeName:
        page = const RegisterView();
        break;
      default:
        page = const Scaffold(body: Center(child: Text("Page not found")));
    }

    return PageRouteBuilder(
      settings: settings,
      transitionDuration: navArgs.animation == NavAnimation.none
          ? Duration.zero
          : navArgs.duration,
      reverseTransitionDuration: navArgs.animation == NavAnimation.none
          ? Duration.zero
          : navArgs.duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (navArgs.animation) {
          case NavAnimation.fade:
            return FadeTransition(opacity: animation, child: child);
          case NavAnimation.translate:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case NavAnimation.none:
            return child;
        }
      },
    );
  }
}
