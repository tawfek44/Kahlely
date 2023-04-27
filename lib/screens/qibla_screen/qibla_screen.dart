import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khalely/constants.dart';
import 'package:khalely/screens/qibla_screen/qibla_compass.dart';
import 'package:khalely/shared_wigets/app_circular_indicator.dart';
import 'package:khalely/shared_wigets/app_text.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

import '../../styles/colors.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double? heading = 0;
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'إتجاة القبلة', isLeading: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: AppCircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: AppText(text: "Error: ${snapshot.error.toString()}"),
              );
            }
            return QiblahCompass();
          },
          /*child: Container(
              width: MediaQuery.of(context).size.width,
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
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          AppText(
                            text: 'الزاوية: ',
                            fontSize: 16.sp,
                          ),
                          AppText(
                            text: heading!.ceil().toString(),
                            fontSize: 16.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.rotate(
                            angle: ((heading ?? 0) * (pi / 180) * -1),
                            child: Image.asset(
                              'assets/compass.png',
                              scale: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))),*/
        ),
      ),
    );
  }
}
