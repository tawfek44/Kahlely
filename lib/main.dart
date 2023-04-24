
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khalely/styles/theme.dart';
import 'app_routes/app_routes.dart';
import 'app_routes/app_routes_names.dart';
import 'di/injection_utils.dart' as di;
import 'di/injection.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  launchApp();
}

void launchApp() => runApp(di.provideApp(const MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 740),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          debugShowCheckedModeBanner: false,
          theme: themeData,
          initialRoute: Routes.homeScreenRoute,
          onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
          navigatorKey: NamedNavigatorImpl.navigatorState,
        );
      },
    );
  }
}
