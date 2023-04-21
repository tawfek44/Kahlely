import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  final String text;
  double? fontSize = 10.sp;
  final int? maxLines;
  final FontWeight fontWeight;
  Color color = Colors.black;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? height;

  AppText({
    Key? key,
    required this.text,
    this.maxLines,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign,
    this.decoration,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: TextOverflow.ellipsis,
        decoration: decoration,
        decorationColor: Colors.black,
        fontFamily: 'NeoSansArabic' ,
      ),
      textDirection: TextDirection.rtl ,
      maxLines: maxLines ?? 2,
    );
  }
}
