import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/add.supplier.view.dart';
import 'package:stocktracker/view/update.supplier.view.dart';
import 'package:stocktracker/view/view.supplier.view.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class Supplier extends StatefulWidget {
  const Supplier({super.key});
  @override
  State<Supplier> createState() => SupplierState();
}

class SupplierState extends State<Supplier> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalColors.whiteColor,
       floatingActionButton: FloatingActionButton(
        backgroundColor: GlobalColors.myColor, //couleur blue
        onPressed: () {Get.off(const AddSupplier());},
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
            const Text("Supplier",style:TextStyle(color:GlobalColors.myColor,fontWeight:FontWeight.w600,)),
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
                      Text("Full Name",style: TextStyle(color:GlobalColors.textColor,fontWeight: FontWeight.w600 ),),
                      ),
                      DataColumn(
                      label: 
                      Text("Email",style: TextStyle(color:GlobalColors.textColor,fontWeight: FontWeight.w600 ),),
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
                      Text("name"),
                    ),
                      //cell2
                     const DataCell(
                      Text("name@gmail.com")
                    ),
                     //cell3
                    DataCell(
                      Row(
                             children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:GlobalColors.myColor,),
                      onPressed: (){Get.off(const ViewSupplier());}, 
                      child:const Icon(Icons.remove_red_eye_outlined,color:Colors.white,size: 20,), ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:GlobalColors.myColor3),
                      onPressed: (){Get.off(const UpdateSupplier());}, 
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
