import 'package:flutter/material.dart';
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
            margin: const EdgeInsets.all(20),
            child: Column(
               children: [
            Image.asset(
              "assets/images/low.png",
              height: 300,
              width: 500,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Low Stock',
              textAlign: TextAlign.center,
              style: TextStyle(color:GlobalColors.myColor, fontSize: 25),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'No Low Stock Yet.',
              style:TextStyle(
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
