import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  //One instance, needs factory
  static AppColors? _instance;
  factory AppColors() => _instance ??= AppColors._();

  AppColors._();

  static final primaryColor = HexColor('#5BB381');  //Color.fromARGB(176, 164, 195, 12);
  static const darkGrey = Color(0xff7C7C7C);
  static const errorColor = Colors.red;
  static const lightGrey= Color(0xFFF5F6F6);
  static const borderColor = Color(0xffE2E2E2);
}
