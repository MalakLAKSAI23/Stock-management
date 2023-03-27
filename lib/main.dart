import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/home.view.dart';
// import 'package:stocktracker/view/spalsh.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.grey,
        primaryColor:GlobalColors.myColor,
      ),
      home:const HomePage(), 
      debugShowCheckedModeBanner: false,
    );
  }
}
