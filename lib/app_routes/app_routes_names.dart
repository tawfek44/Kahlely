class Routes {
  static const splashScreenRoute = "SPLASH_SCREEN_ROUTE";
  static const homeScreenRoute = "HOME_SCREEN_ROUTE";
  static const prayerTimingsScreenRoute = "PRAYER_TIMINGS_SCREEN_ROUTE";






}

abstract class NamedNavigator {
  Future push(String routeName,
      {dynamic arguments, bool replace = false, bool clean = false});

  void pop({dynamic result});
}
