import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:khalely/screens/azkar/azkar_morning_nights/azkar_morning_nights.dart';
import 'package:khalely/screens/azkar/sleep_azkar/sleep_azkar_screen.dart';
import 'package:khalely/screens/home_screen/home_screen.dart';
import 'package:khalely/screens/prayer_timings_screen/prayer_timings_screen.dart';
import 'package:khalely/screens/surah_names_screen/surah_names_screen.dart';
import 'package:khalely/screens/surah_screen/surah_screen.dart';

import '../screens/qibla_screen/qibla_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import 'app_routes_names.dart';

class NamedNavigatorImpl implements NamedNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const Directionality(
                  textDirection: TextDirection.rtl,
                  child: SplashScreen(),
                ));
      case Routes.homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Directionality(
              textDirection: TextDirection.rtl, child: HomeScreen()),
        );

      case Routes.prayerTimingsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => Directionality(
              textDirection: TextDirection.rtl, child: PrayerTimingsScreen()),
        );

      case Routes.qiblahScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Directionality(
              textDirection: TextDirection.rtl, child: QiblaScreen()),
        );

      case Routes.AzkarMorinigAndNightScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Directionality(
              textDirection: TextDirection.rtl, child: AzkarMorningAndNight()),
        );

      case Routes.AzkarSleepScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Directionality(
              textDirection: TextDirection.rtl, child: SleepAzkarScreen()),
        );

      case Routes.QuranSurahNamesScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Directionality(
              textDirection: TextDirection.rtl, child: SurahNamesScreen()),
        );

      case Routes.SurahScreenRoute:
        return MaterialPageRoute(
          builder: (_) => Directionality(
              textDirection: TextDirection.rtl,
              child: SurahScreen(
                surahNumber: settings.arguments,
              )),
        );
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
  Future push(String routeName,
      {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    }

    if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }

    return navigatorState.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
}
