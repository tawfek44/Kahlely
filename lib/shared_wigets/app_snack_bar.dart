import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import 'app_text.dart';

// ignore: non_constant_identifier_names
Widget AppSnackBar({
  required String text,
  required bool isSuccess,
  Duration? duration,
  SnackBarBehavior? behavior,
  int? maxLines,
  Color? textColor,
}) {
  return SnackBar(
    content: AppText(
      text: text,
      maxLines: maxLines ?? 1,
      color: textColor ?? Colors.white,
    ),
    backgroundColor: isSuccess ? AppColors.primaryColor : Colors.red,
    duration: duration ?? const Duration(seconds: 2),
    behavior: behavior ?? SnackBarBehavior.floating,
  );
}
