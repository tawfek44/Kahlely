import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalely/di/injection.dart';

import '../../data/repositories/prayer_timinigs_repository.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: (){

              },
              child: Text('ok'),
          ),
        ],
      ),
    );
  }
}
