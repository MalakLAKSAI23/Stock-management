import 'package:flutter/material.dart';
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                 children: [
              Image.asset(
                "assets/images/infos.png",
                height: 300,
                width: 500,
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
              const Text(
                'is an application that will allow companies to manage their stock more efficiently\n by recording product entries and exits, monitoring stock levels.',
                style:TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
              )),
        ),
      ),
    );
  }
}
