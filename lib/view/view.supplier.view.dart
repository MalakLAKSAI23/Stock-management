import 'package:flutter/material.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class ViewSupplier extends StatefulWidget {
  const ViewSupplier({super.key});
  @override
  State<ViewSupplier> createState() => ViewSupplierState();
}

class ViewSupplierState extends State<ViewSupplier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
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
      body:
       Center(
        
         child:  Container(
          
              padding:const EdgeInsets.only(top:30,left: 20,right: 20,bottom: 30),
              width:300,
              height: 500,
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset:const Offset(0, 3), // changes position of shadow
            ),
            ],
          ),
          child:
           Column(children: [
           
                Image.asset(
                 "assets/images/supplier2.png",
                 height: 250,
                 width: 250,
              
             ),
             const SizedBox(
               height: 12,
             ),
            const Text(
               'Supplier',
               textAlign: TextAlign.center,
               style: TextStyle(color: GlobalColors.myColor, fontSize: 25),
             ),
              const Align(alignment: Alignment.centerLeft,
              child: Text("Name",
                 style: TextStyle(
                     color: GlobalColors.myColor3,
                     fontWeight: FontWeight.w200,
                     fontSize: 20)),),
              const Align(alignment: Alignment.centerLeft,
              child:Text(
               "LAKSAI MALAK",
               style: TextStyle(color: GlobalColors.textColor),
             ), ),
             const Align(alignment: Alignment.centerLeft,
              child:Text("Email",
                 style: TextStyle(
                     color: GlobalColors.myColor3,
                     fontWeight: FontWeight.w200,
                     fontSize: 20)), ),
              const Align(alignment: Alignment.centerLeft,
              child:Text(
               "malaklaksai21@gmail.com",
               style: TextStyle(color: GlobalColors.textColor),
             ), ),
             const Align(alignment: Alignment.centerLeft,
              child:Text("Phone number",
                 style: TextStyle(
                     color: GlobalColors.myColor3,
                     fontWeight: FontWeight.w200,
                     fontSize: 20)), ),
                     const Align(alignment: Alignment.centerLeft,
              child: Text(
               "06060606666",
               style: TextStyle(color: GlobalColors.textColor),
             ) ),
          
             
           ]),
          ),
             
       ),
    );
  }
}
