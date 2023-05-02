import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/components/crud.dart';
import 'package:stocktracker/components/linkapi.dart';
import 'package:stocktracker/main.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/card.product.view.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class Product extends StatefulWidget {
  const Product({super.key});
  @override
  State<Product> createState() => ProductState();
}

class ProductState extends State<Product> with Crud {
  getProduct() async {
    var response = await postRequest(
        linkViewProduct, {"user_id": sharedPref.getString("user_id")});
    return response;
  }

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
          child: FutureBuilder(
            future: getProduct(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData && snapshot.data != null && snapshot.data['data'] != null) {
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    // snapshot.data['data'].length,
                    snapshot.data['data']?.length ?? 0,
                    (index) {
                      var product = snapshot.data['data'][index];
                      return CardProduct(
                        onPressed: () {},
                        productTitle: "${product['name_p']}",
                        price: "${product['price_p']}",
                      );
                    },
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: GlobalColors.myColor,),
                );
              } else {
                return Expanded(
                  child: Center(
                    child: Text("noDataFound".tr),
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
