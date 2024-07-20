

import 'package:flutter/material.dart';

import '../../core/utils/app_text_styles.dart';

class Routes {
  static const String initialRoute = '/';

}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.initialRoute:
        // return MaterialPageRoute(builder: (context) => const SplashScreen());


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
            style: AppTextStyles.title18WhiteTextStyle,
          ),
        ),
      ),
    );
  }
}
