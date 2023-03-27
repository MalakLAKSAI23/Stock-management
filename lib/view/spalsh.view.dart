import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/auth/select.auth.dart';
import 'package:stocktracker/utils/global.colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds:6), () {
      Get.to(const SelectAuth());
    });
    return Scaffold(
      backgroundColor: GlobalColors.myColor,
      body: Center(

        child: Container(
          width:160,
          height: 160,
          margin:const EdgeInsets.all(40),
          child: 
            Image.asset("assets/images/1.png"),
        ),
      ),
    );
  }
}
