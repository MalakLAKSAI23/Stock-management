import 'package:flutter/material.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});
  @override
  State<ViewProduct> createState() => ViewProductState();
}

class ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
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
      body:
       SingleChildScrollView(
         child: 
         Container(
          alignment: Alignment.center,
          margin:const EdgeInsets.only(top: 40),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Container(
                padding:const EdgeInsets.only(top:30,left: 20,right: 20,bottom: 30),
                width:300,
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
            child:Column(
              children: [
              const CircleAvatar(backgroundImage: AssetImage("assets/images/produit.png") ,radius: 70,),
              const SizedBox(height: 15,),
                const Text("Huile Graine de Nigelle",style: TextStyle(color: GlobalColors.myColor,fontSize: 18,fontWeight:FontWeight.w600),),
                const SizedBox(height: 12,),
                 const Align(
                      alignment: Alignment.centerLeft,
                      child:Text("Description",style: TextStyle(color: GlobalColors.myColor3,fontWeight:FontWeight.w200)),),
                 const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Racine Vita Huile Graine de Nigelle 40 ml",style: TextStyle(color:GlobalColors.textColor),),
                 ),
                  const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Quantity",style: TextStyle(color: GlobalColors.myColor3,fontWeight:FontWeight.w200)),
                 ),
                  const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("20",style: TextStyle(color:GlobalColors.textColor),),
                 ),
                  const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Price",style: TextStyle(color: GlobalColors.myColor3,fontWeight:FontWeight.w200)),
                 ),
                 const Align(
                  alignment: Alignment.centerLeft,
                  child:  Text("50 MAD",style: TextStyle(color:GlobalColors.textColor),),
                 ),
                  const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Supplier",style: TextStyle(color: GlobalColors.myColor3,fontWeight:FontWeight.w200)),  ),
                  Align(
                  alignment: Alignment.centerLeft,
                  child: Row(children: const [
                           Text("name: ",style: TextStyle(color:GlobalColors.textColor),),
                           Text("MALAK LAKSAI",style: TextStyle(color:GlobalColors.textColor),),
                         ],),
                  ),
                  Align(
                  alignment: Alignment.centerLeft,
                  child:  
                         Row(children: const [
                           Text("email: ",style: TextStyle(color:GlobalColors.textColor),),
                           Text("malaklaksai21@gmail.com",style: TextStyle(color:GlobalColors.textColor),),
                         ],),
                  ),
                  Align(
                  alignment: Alignment.centerLeft,
                  child:  Row(children: const [
                           Text("phone number: ",style: TextStyle(color:GlobalColors.textColor),),
                           Text("060606666666",style: TextStyle(color:GlobalColors.textColor),),
                         ],)
                         
                  ),
              ]),
                
              
            ),
               
                
              ]
           ),
         ),
       ),
    );
  }
}
