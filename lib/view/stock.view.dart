import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/update.product.view.dart';
import 'package:stocktracker/view/view.product.stock.view.dart';
import 'package:stocktracker/view/add.product.view.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class Stock extends StatefulWidget {
  const Stock({super.key});
  @override
  State<Stock> createState() => StockState();
}

class StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
       floatingActionButton: FloatingActionButton(
        backgroundColor: GlobalColors.myColor, //couleur blue
        onPressed: () { Get.off(const AddProduct());},
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
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
          )
        ),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: 
        Column(
          children: [
            const Text("Stock",style:TextStyle(color:GlobalColors.myColor,fontWeight:FontWeight.w600,)),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: DataTable(
                   dataRowHeight: 70, 
                  columns:const  [
                    DataColumn(
                      label: 
                      Text("Picture",style: TextStyle(color:GlobalColors.textColor,fontWeight: FontWeight.w600 ),),
                      ),
                      DataColumn(
                      label: 
                      Text("Product Name",style: TextStyle(color:GlobalColors.textColor,fontWeight: FontWeight.w600 ),),
                      ),
                      DataColumn(
                      label: 
                      Text("  Operation",style: TextStyle(color:GlobalColors.textColor,fontWeight: FontWeight.w600 ),),
                      ),
                  ],
                  rows: [
                    //row1
                    DataRow(cells: [
                      //cell1
                      const DataCell(
                      CircleAvatar(
                      radius: 26, // rayon du cercle
                      backgroundImage: AssetImage('assets/images/produit.png',),
                      ),
                    ),
                      //cell2
                     const DataCell(
                      Text("Racine Vita Huile Graine de Nigelle 40 ml")
                    ),
                     //cell3
                    DataCell(
                      Row(
                             children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:GlobalColors.myColor,),
                      onPressed: (){ Get.off(const ViewProduct());}, 
                      child:const Icon(Icons.remove_red_eye_outlined,color:Colors.white,size: 20,), ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:GlobalColors.myColor3),
                      onPressed: (){ Get.off(const UpdateProduct());}, 
                      child:const Icon(Icons.create,color:Colors.white,size: 20,), ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:GlobalColors.myColor2 ),
                      onPressed: (){}, 
                      child:const Icon(Icons.delete_outline_rounded,color:Colors.white,size: 20,), ),
                             ],
                        )
                        ),
                        ],
                        ),
    
                  ],
                  ),
               ),
            )
          ],
        ),

      ) ,
    );
  }

}
