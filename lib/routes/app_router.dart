import 'package:flutter/material.dart';
import 'package:fruit_hub/routes/app_route_name.dart';
import 'package:fruit_hub/screens/authentication.dart';
import 'package:fruit_hub/screens/home.dart';
import 'package:fruit_hub/screens/splash.dart';
import 'package:fruit_hub/screens/welcome.dart';

String route = "";

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    route = routeSettings.name ?? "";
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
         
          case AppRouteName.SPLASH_SCREEN_ROUTE:
            return const SplashScreen();

          case AppRouteName.WELCOME_SCREEN_ROUTE:
            return const WelcomeScreen();

          case AppRouteName.AUTHENTICATION_SCREEN_ROUTE:
            return  const AuthenticationScreen();
          
            case AppRouteName.HOME_SCREEN_ROUTE:
            return  HomeScreen();
              default:
            return Container();
        }
      },
    );
  }
}