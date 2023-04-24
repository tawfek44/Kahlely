import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalely/app_routes/app_routes.dart';
import 'package:khalely/shared_wigets/app_text.dart';
import 'package:khalely/styles/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title, required this.isLeading})
      : super(key: key);
  final String title;
  final bool isLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: AppText(
        text: title,
        color: AppColors.primaryColor,
      ),
      leading: isLeading
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.primaryColor,
              ),
              onPressed: () {
                NamedNavigatorImpl().pop();
              },
            )
          : null,
    );
  }
}
