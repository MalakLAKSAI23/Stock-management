import 'package:flutter/material.dart';
import 'package:stocktracker/components/crud.dart';
import 'package:stocktracker/components/linkapi.dart';
import 'package:stocktracker/main.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class Supplier extends StatefulWidget {
  const Supplier({super.key});
  @override
  State<Supplier> createState() => SupplierState();
}

class SupplierState extends State<Supplier> with Crud {
   getSupplier() async {
    var response = await postRequest(
        linkViewSupplier, {"user_id": sharedPref.getString("user_id")});
    return response;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalColors.whiteColor,
       floatingActionButton: FloatingActionButton(
        backgroundColor: GlobalColors.myColor, //couleur blue
        onPressed: () { Navigator.of(context).pushNamed("addSupplier");},
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
          )
        ),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: 
        Column(
          children: [
            const Text("Supplier",style:TextStyle(color:GlobalColors.myColor,fontWeight:FontWeight.w600,fontSize: 20,)),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child:
                 FutureBuilder(
                  future: getSupplier(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data['data'] != null) {
                          return  DataTable(
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
                      Text("Phone number",style: TextStyle(color:GlobalColors.textColor,fontWeight: FontWeight.w600 ),),
                      ),
                      DataColumn(
                      label: 
                      Text("Operation",style: TextStyle(color:GlobalColors.textColor,fontWeight: FontWeight.w600 ),),
                      ),
                      ], rows: 
                        List.generate(
                            snapshot.data['data']?.length ?? 0,
                             (index) {
                              var supplier= snapshot.data['data'][index];
                              return DataRow(
                                cells:[
                      DataCell(
                      Text("${supplier['name_s']}"),
                    ),
                      //cell2
                     DataCell(
                      Text("${supplier['email_s']}"),
                    ),
                    DataCell(
                      Text("${supplier['phone_s']}"),
                    ),
                     //cell3
                    DataCell(
                      Row(
                             children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:GlobalColors.myColor,),
                      onPressed: (){ Navigator.of(context).pushNamed("viewSupplier");}, 
                      child:const Icon(Icons.remove_red_eye_outlined,color:Colors.white,size: 20,), ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:GlobalColors.myColor3),
                      onPressed: (){ Navigator.of(context).pushNamed("updateSupplier");}, 
                      child:const Icon(Icons.create,color:Colors.white,size: 20,), ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:GlobalColors.myColor2 ),
                      onPressed: (){}, 
                      child:const Icon(Icons.delete_outline_rounded,color:Colors.white,size: 20,), ),
                             ],
                        )
                        ),   //cell1
           
                                ] );
                             },),
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

      ) ,
    );
  }

}



