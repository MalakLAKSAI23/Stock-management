import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/components/crud.dart';
import 'package:stocktracker/main.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/update.product.view.dart';
import 'package:stocktracker/view/widget/drawer.dart';
import '../components/linkapi.dart';

class Stock extends StatefulWidget {
  const Stock({super.key});
  @override
  State<Stock> createState() => StockState();
}

class StockState extends State<Stock> with Crud {
  getStock() async {
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
        onPressed: () {
          Navigator.of(context).pushNamed("addProduct");
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
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
                )),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          children: [
            const Text("Stock",
                style: TextStyle(
                    color: GlobalColors.myColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder(
                  future: getStock(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data['data'] != null) {
                      return DataTable(
                        dataRowHeight: 70,
                        columns:[
                          DataColumn(
                            label: Text(
                              "picture".tr,
                              style:const TextStyle(
                                  color: GlobalColors.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "prodName".tr,
                              style:const TextStyle(
                                  color: GlobalColors.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "prodDesc".tr,
                              style:const  TextStyle(
                                  color: GlobalColors.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "quantite".tr,
                              style:const TextStyle(
                                  color: GlobalColors.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Price",
                              style: TextStyle(
                                  color: GlobalColors.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Supplier",
                              style: TextStyle(
                                  color: GlobalColors.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Min",
                              style: TextStyle(
                                  color: GlobalColors.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "  Operation",
                              style: TextStyle(
                                  color: GlobalColors.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                        rows: List.generate(
                          snapshot.data['data']?.length ?? 0,
                          (index) {
                            var product = snapshot.data['data'][index];
                            return DataRow(cells: [
                              //cell1
                              const DataCell(
                                CircleAvatar(
                                  radius: 26, // rayon du cercle
                                  backgroundImage: AssetImage(
                                    'assets/images/produit.png',
                                  ),
                                ),
                              ),
                              //cell2
                              DataCell(Text("${product['name_p']}")),
                              //cell3
                              DataCell(Text("${product['description_p']}")),
                              //cell4
                              DataCell(Text("${product['quantite_p']}")),
                              //cell5
                              DataCell(Text("${product['price_p']}")),
                              //cell6
                              DataCell(Text("${product['id_s']}")),
                              //cell7
                              DataCell(Text("${product['min_p']}")),
                              //cell8
                              DataCell(Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: GlobalColors.myColor,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed("viewProduct");
                                    },
                                    child: const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: GlobalColors.myColor3),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateProduct(
                                                    product: snapshot
                                                        .data['data'][index],
                                                  )));
                                      // Navigator.of(context).pushNamed("updateProduct");
                                    },
                                    child: const Icon(
                                      Icons.create,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: GlobalColors.myColor2),
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.delete_outline_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )),
                            ]);
                          },
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: GlobalColors.myColor,
                        ),
                      );
                    } else {
                      return const Expanded(
                        child: Center(
                          child: Text("No data found."),
                        ),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
