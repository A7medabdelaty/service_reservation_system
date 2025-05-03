import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'routes/app_router.dart';
import 'routes/route_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Reservation',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Follows system theme
      initialRoute: RouteConstants.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
