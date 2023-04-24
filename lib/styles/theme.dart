import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

String neoSansArabic = "NeoSansArabic";
ThemeData themeData = ThemeData(
  primaryColor: AppColors.primaryColor,
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  fontFamily:  neoSansArabic,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme:ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
);
