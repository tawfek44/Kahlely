import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khalely/app_routes/app_routes.dart';
import 'package:khalely/app_routes/app_routes_names.dart';
import 'package:khalely/constants.dart';
import 'package:khalely/shared_wigets/app_text.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Center(child: getAppSplashIcon()),
      ),
    );
  }

  Widget getAppSplashIcon() {
    return Lottie.asset('assets/splash_icon.json');
  }

  Future onTimerFinished() async {
    const delay = Duration(seconds: 5);
    await Future.delayed(delay).then((value) {
      NamedNavigatorImpl().push(Routes.homeScreenRoute, clean: true);
    });
  }

  @override
  void initState() {
    super.initState();
    onTimerFinished();
  }
}
