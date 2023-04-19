import 'package:flutter/material.dart';

import '../screens/splash_screen/splash_screen.dart';
import 'app_routes_names.dart';



class NamedNavigatorImpl implements NamedNavigator {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings,) {
    switch (settings.name) {

      case Routes.splashScreenRoute :return MaterialPageRoute(builder: (_) => const SplashScreen());

    }

    return MaterialPageRoute(builder: (_) => Container());
  }

  @override
  void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  @override
  Future push(String routeName, {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
    }

    if (replace) {
      return navigatorState.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    }

    return navigatorState.currentState!.pushNamed(routeName, arguments: arguments);
  }
}
