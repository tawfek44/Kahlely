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
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Center(
                  child: AppText(text: "خطا: ${snapshot.error.toString()}"),
                ),
              );
            }
            return QiblahCompass();
          },
        ),
      ),
    );
  }
}
