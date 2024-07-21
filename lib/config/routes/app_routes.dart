

import 'package:flutter/material.dart';
import 'package:plants_informations/view/screens/home_screen.dart';

import '../../core/utils/app_text_styles.dart';
import '../../view/screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String home = '/home';

}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return undefinedRoute(settings);
    }
  }

  static Route<dynamic> undefinedRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            'Unknown route for => ${settings.name}',
            style: AppTextStyles.title18BlackTextStyle,
          ),
        ),
      ),
    );
  }
}
