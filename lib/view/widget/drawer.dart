import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/Product.view.dart';
import 'package:stocktracker/view/dashboard.view.dart';
import 'package:stocktracker/view/lowStock.view.dart';
import 'package:stocktracker/view/stock.view.dart';
import 'package:stocktracker/view/supplier.view.dart';

import '../home.view.dart';
import '../infos.view.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: GlobalColors.myColor, width: 7.5)),
            ),
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/2.png'),
                    ),
                  ),
                ),
                const Text("malaklaksai21@gmail.com",
                    style: TextStyle(color: GlobalColors.textColor))
              ],
            ),
          ),
          ListTile(
              title: const Text("Home Page"),
              leading: const Icon(Icons.home),
              onTap: () {
                Get.off(const HomePage());
              }),
          ListTile(
            title: const Text("Stock"),
            leading: const Icon(Icons.auto_graph_outlined),
            onTap: () => Get.off(const Stock()),
          ),
          ListTile(
            title: const Text("Supplier"),
            leading: const Icon(Icons.person_3_outlined),
            onTap: () => Get.off(const Supplier()),
          ),
          ListTile(
            title:const  Text("Product"),
            leading:const Icon(Icons.ballot_outlined),
            onTap: () => Get.off(const Product()),
          ),
          ListTile(
              title: const Text("Dashbord"),
              leading: const Icon(Icons.dashboard_outlined),
              onTap: () {
                Get.off(const Dashboard());
              }),
          ListTile(
            title:const Text("Low Stock"),
            leading:const Icon(Icons.notifications_active_outlined),
            onTap: () => Get.off(const LowStock()),
          ),
          ListTile(
              title: const Text("Infos"),
              leading: const Icon(Icons.info_outline_rounded),
              onTap: () {
                Get.off(const Infos());
              })
        ],
      ),
    );
  }
}
