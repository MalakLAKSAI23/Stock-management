import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/locale/locale_controller.dart';
import 'package:stocktracker/main.dart';
import 'package:stocktracker/utils/global.colors.dart';


class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  MyLocaleController controllerlang = Get.find();
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: 
      ListView(
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
              title: Text("home".tr),
              leading: const Icon(Icons.home),
            onTap:() => Navigator.of(context).pushNamed("home"),
              ),
          ListTile(
            title: Text("stock".tr),
            leading: const Icon(Icons.auto_graph_outlined),
            onTap:() => Navigator.of(context).pushNamed("stock"),
      
          ),
          ListTile(
            title: Text("supplier".tr),
            leading: const Icon(Icons.person_3_outlined),
            onTap:() => Navigator.of(context).pushNamed("supplier"),
      
          ),
          ListTile(
            title: Text("product".tr),
            leading:const Icon(Icons.ballot_outlined),
            onTap:() => Navigator.of(context).pushNamed("product"),
          ),
          ListTile(
              title:Text("dashboard".tr),
              leading: const Icon(Icons.dashboard_outlined),
            onTap:() => Navigator.of(context).pushNamed("dashboard"),
            ),
          ListTile(
            title:Text("lowStock".tr),
            leading:const Icon(Icons.notifications_active_outlined),
            onTap:() => Navigator.of(context).pushNamed("lowStock"),
      
            // onTap: () => Get.off(const LowStock()),
          ),
          ListTile(
              title:Text("languages".tr),
              leading: const Icon(Icons.translate),
              onTap:() => Navigator.of(context).pushNamed("languages"),
              ),
          ListTile(
              title:Text("infos".tr),
              leading: const Icon(Icons.info_outline_rounded),
              onTap:() => Navigator.of(context).pushNamed("infos"),
              ),
          ListTile(
              title: Text("logout".tr),
              leading: const Icon(Icons.logout_outlined),
              onTap:() {
                sharedPref.clear();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("splashView", (route) => false);
              } 
              )    
        ],
      ),
    );
  }
}
