import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

String gilroyFontFamily = "Gilroy";
String tajawal="Tajawal";
ThemeData themeData = ThemeData(
  primaryColor: AppColors.primaryColor,
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  fontFamily:  tajawal,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
);
