import 'package:flutter/material.dart';
import 'package:stocktracker/components/crud.dart';
import 'package:stocktracker/components/linkapi.dart';
import 'package:stocktracker/main.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class Product extends StatefulWidget {
  const Product({super.key});
  @override
  State<Product> createState() => ProductState();
}

class ProductState extends State<Product> with Crud {
  getProduct() async {
    var response = await postRequest(
        linkViewProduct, {
          "user_p": sharedPref.getString("id")
          });
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
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          child: 
          Wrap(
            spacing: 10, // Définit un espacement horizontal de 10 pixels
            runSpacing: 10, // Définit un espacement vertical de 10 pixels
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: [
              //  CardProduct(onPressed: () {  }, price: '12345', productTitle: 'test',)
              FutureBuilder(
                  future: getProduct(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data['data'].lenght,
                        shrinkWrap: true,
                        physics:NeverScrollableScrollPhysics() ,
                        itemBuilder: (context, i) {
                        return Text("${snapshot.data['data']['name_p']}");
                      });
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Text("Loading ..."),
                      );
                    }
                    return const Center(
                      child: Text("Loading ..."),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
