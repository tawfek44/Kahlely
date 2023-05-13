import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:khalely/app_routes/app_routes.dart';
import 'package:khalely/shared_wigets/app_text.dart';
import 'package:khalely/styles/colors.dart';

import '../../app_routes/app_routes_names.dart';
import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar(title: 'خليلى', isLeading: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              getUpperCard(),
              SizedBox(
                height: 20.h,
              ),
              AppText(
                text: 'الأقسام',
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontSize: 20.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              getDepartmentsGridView(),
            ],
          ),
        ));
  }

  Widget getUpperCard() => Container(
        height: 180.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor,
                AppColors.secondlyColor
              ],
            ),
            borderRadius: BorderRadius.circular(15.w)),
        child: Row(
          children: [
            getDateInfo(),
            const Spacer(),
            getQuranIcon(),
          ],
        ),
      );

  Widget getDateInfo() => Padding(
        padding: EdgeInsets.only(right: 10.w, top: 36.h),
        child: Column(
          children: [
            AppText(
              text: getTimeInArabic(),
              color: Colors.white,
              fontSize: 40.sp,
            ),
            AppText(
              text: getGeorgianTimeInArabic(),
              color: Colors.white,
              fontSize: 20.sp,
            ),
            AppText(
              text: getHijriTimeInArabic(),
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ],
        ),
      );
  Widget getQuranIcon() => Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: SizedBox(width: 100.w, child: Image.asset('assets/quran.png')),
      );

  Widget getDepartmentsGridView() => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120.w,
            childAspectRatio: 1,
            crossAxisSpacing: 15.h,
            mainAxisSpacing: 15.w),
        itemCount: 7,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              switch (index) {
                case 0:
                  {
                    NamedNavigatorImpl()
                        .push(Routes.QuranSurahNamesScreenRoute);
                  }
                  break;
                case 1:
                  {
                    NamedNavigatorImpl().push(Routes.qiblahScreenRoute);
                  }
                  break;
                case 2:
                  {
                    NamedNavigatorImpl()
                        .push(Routes.AzkarMorinigAndNightScreenRoute);
                  }
                  break;
                case 3:
                  {
                    NamedNavigatorImpl()
                        .push(Routes.HadithTellerNamesScreenRoute);
                  }
                  break;
                case 4:
                  {
                    NamedNavigatorImpl().push(Routes.prayerTimingsScreenRoute);
                  }
                  break;
                case 5:
                  {
                    NamedNavigatorImpl().push(Routes.AzkarSleepScreenRoute);
                  }
                  break;
                case 6:
                  {
                    NamedNavigatorImpl()
                        .push(Routes.QuranSurahTranslationNamesScreenRoute);
                  }
                  break;
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  border: Border.all(color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/${appDepartmentsIcons[index]}',
                      width: 50.w),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppText(
                    text: appDepartmentsNames[index],
                    fontSize: 12.sp,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        },
      );

  String getTimeInArabic() {
    var now = DateTime.now();
    var formatter = DateFormat.jm('ar_SA').format(now);
    return formatter;
  }

  String getGeorgianTimeInArabic() {
    var now = DateTime.now();
    var formatter = DateFormat.yMMMMEEEEd('ar_SA').format(now);
    return formatter;
  }

  String getHijriTimeInArabic() {
    HijriCalendar.setLocal('ar');
    var formatter =
        '${HijriCalendar.now().hDay.toString()} ${HijriCalendar.now().longMonthName.toString()} ${HijriCalendar.now().hYear.toString()}';
    return formatter;
  }
}
