import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/Product.view.dart';
import 'package:stocktracker/view/dashboard.view.dart';
import 'package:stocktracker/view/infos.view.dart';
import 'package:stocktracker/view/lowStock.view.dart';
import 'package:stocktracker/view/stock.view.dart';
import 'package:stocktracker/view/supplier.view.dart';
import 'package:stocktracker/view/widget/container.home.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: GlobalColors.myColor, //couleur blue
        onPressed: () {},
        child: const Icon(
          Icons.language_rounded,
          color: Colors.white,
        ),
      ),
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
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/2.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerHome(
                        assetImage:
                            const AssetImage('assets/images/dashboard.png'),
                        onTap: () {
                          Get.off(const Dashboard());
                        },
                        color: const Color(0xff9bc9ff),
                        text: "Dahboard"),
                    ContainerHome(
                        assetImage:
                            const AssetImage('assets/images/lowstock.png'),
                        onTap: () {
                          Get.off(const LowStock());
                        },
                        color: const Color(0xffb00909),
                        text: "Low Stock")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerHome(
                        assetImage:
                            const AssetImage('assets/images/product.png'),
                        onTap: () {
                          Get.off(const Product());
                        },
                        color: const Color(0xffef78b4),
                        text: "All Product"),
                    ContainerHome(
                        assetImage: const AssetImage('assets/images/stock.png'),
                        onTap: () {
                          Get.off(const Stock());
                        },
                        color: const Color(0xff042698),
                        text: "Stock"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerHome(
                        assetImage:
                            const AssetImage('assets/images/supplier.png'),
                        onTap: () {
                          Get.off(const Supplier());
                        },
                        color: const Color(0xffffe472),
                        text: "Supplier"),
                    ContainerHome(
                        assetImage: const AssetImage('assets/images/info.png'),
                        onTap: () {
                          Get.off(const Infos());
                        },
                        color: const Color(0xff04905c),
                        text: "Infos"),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
