import 'package:flutter/material.dart';
import 'package:stocktracker/main.dart';
import 'package:stocktracker/utils/global.colors.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                sharedPref.clear();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("splashView", (route) => false);
              },
              icon: const Icon(Icons.logout_outlined,color: GlobalColors.myColor,size: 30,)),
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
      body: Center(
        child: SingleChildScrollView(
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
                          onTap: () =>
                              Navigator.of(context).pushNamed("dashboard"),
                          color: const Color(0xff9bc9ff),
                          text: "Dahboard"),
                      ContainerHome(
                          assetImage:
                              const AssetImage('assets/images/lowstock.png'),
                          onTap: () =>
                              Navigator.of(context).pushNamed("lowStock"),
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
                          onTap: () =>
                              Navigator.of(context).pushNamed("product"),
                          color: const Color(0xffef78b4),
                          text: "All Product"),
                      ContainerHome(
                          assetImage:
                              const AssetImage('assets/images/stock.png'),
                          onTap: () => Navigator.of(context).pushNamed("stock"),
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
                          onTap: () =>
                              Navigator.of(context).pushNamed("supplier"),
                          color: const Color(0xffffe472),
                          text: "Supplier"),
                      ContainerHome(
                          assetImage:
                              const AssetImage('assets/images/info.png'),
                          onTap: () => Navigator.of(context).pushNamed("infos"),
                          color: const Color(0xff04905c),
                          text: "Infos"),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
