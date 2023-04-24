import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  //One instance, needs factory
  static AppColors? _instance;
  factory AppColors() => _instance ??= AppColors._();

  AppColors._();

  static final primaryColor = HexColor('#8a59d1');  //Color.fromARGB(176, 164, 195, 12);
  static final secondlyColor = HexColor('#632bbb');  //Color.fromARGB(176, 164, 195, 12);
  static const darkGrey = Color(0xff7C7C7C);
  static final lightGrey = HexColor('#eedfeb');
  static const errorColor = Colors.red;
}
