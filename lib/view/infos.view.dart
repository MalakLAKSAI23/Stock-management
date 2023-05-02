import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class Infos extends StatefulWidget {
  const Infos({super.key});
  @override
  State<Infos> createState() => InfosState();
}

class InfosState extends State<Infos> {
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
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
               children: [
                Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Icon(
                Icons.info,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'infos',
                style: TextStyle( fontSize: 35),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
            Image.asset(
              "assets/images/infos.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              '"Stock Tracker"',
              textAlign: TextAlign.center,
              style: TextStyle(color:GlobalColors.myColor, fontSize: 25),
            ),
            const SizedBox(
              height: 12,
            ),
             Text(
              "infosText".tr,
              style:const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
            )),
      ),
    );
  }
}
