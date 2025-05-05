import 'package:flutter/material.dart';
import 'package:service_reservation_system/features/auth/presentation/pages/reset_password_page.dart';

import '../core/presentation/pages/error_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/specialists/presentation/pages/specialist_detail_page.dart';
import '../features/specialists/presentation/pages/specialists_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import 'route_constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    Widget page;
    bool useSlideTransition = true;

    switch (settings.name) {
      case RouteConstants.splash:
        page = const SplashPage();
        useSlideTransition = false; // Use fade for splash
        break;

      case RouteConstants.home:
        page = const HomePage();
        break;

      case RouteConstants.login:
        page = const LoginPage();
        useSlideTransition = false; // Use fade for auth pages
        break;

      case RouteConstants.register:
        page = const RegisterPage();
        useSlideTransition = false;
        break;

      case RouteConstants.resetPassword:
        page = const ResetPasswordPage();
        break;

      case RouteConstants.specialists:
        page = const SpecialistsPage();
        break;

      case RouteConstants.specialistDetail:
        if (args is! Map<String, dynamic>) {
          throw ArgumentError('Specialist detail requires an ID parameter');
        }
        page = SpecialistDetailPage(specialistId: args['id'] as String);
        break;

      default:
        page = const ErrorPage(message: 'Route not found');
    }

    if (useSlideTransition) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    // Fade transition for auth pages
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
