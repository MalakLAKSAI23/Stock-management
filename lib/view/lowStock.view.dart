import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class LowStock extends StatefulWidget {
  const LowStock({super.key});
  @override
  State<LowStock> createState() => LowStockState();
}

class LowStockState extends State<LowStock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: AppBar(
         actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: GlobalColors.myColor,
                size: 30,
              )),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
            color: GlobalColors.myColor,
            iconSize: 30,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: 
      SingleChildScrollView(
        child: Container(
           alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
            Image.asset(
              "assets/images/low.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'lowStock'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(color:GlobalColors.myColor, fontSize: 25),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'noLowStock'.tr,
              style:const TextStyle(
                fontSize: 20,
                color: GlobalColors.textColor,
              ),
            ),
          ],
            )),
      ),
    );
  }
}
