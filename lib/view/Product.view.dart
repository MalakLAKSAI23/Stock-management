import 'package:flutter/material.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/drawer.dart';

class Product extends StatefulWidget {
  const Product({super.key});
  @override
  State<Product> createState() => ProductState();
}

class ProductState extends State<Product> {
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
        child:
         Container(
          margin:const EdgeInsets.all(30),
           child: Wrap(
             spacing: 10, // Définit un espacement horizontal de 10 pixels
             runSpacing: 10, // Définit un espacement vertical de 10 pixels
         alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: [
              Container(
                width: 200,
                height: 300,
               decoration:BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(40),
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
              Image.asset("assets/images/produit.png",fit:BoxFit.cover,width: double.infinity,),
              const SizedBox(height: 11,),
              const Text("Racine Vita Huile Graine",style: TextStyle(color:GlobalColors.textColor),),
              Container(
                margin:const EdgeInsets.only(left:30),
                child: Row(children: const [
                Text("50",style: TextStyle(color:GlobalColors.textColor),),
                SizedBox(width: 10,),
                Text("MAD",style: TextStyle(color:GlobalColors.myColor),),
              ],),),
              const SizedBox(
                height: 12,
              ),
        SizedBox(
        width: 150,
        height: 30,
       child: 
       ElevatedButton(
         style: ElevatedButton.styleFrom(
           backgroundColor:GlobalColors.myColor3,
           padding: const EdgeInsets.symmetric(vertical: 16.0),
           //definir un border radius pour ce btn
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10),
           ),
         ),
         onPressed:(){},
         child:const Text("Buy Now",
           style:TextStyle(
             color:Colors.white,
             fontWeight: FontWeight.w500
           ),
         ),
       ),
        ),
            ]),
            ),
             Container(
                width: 200,
                height: 300,
               decoration:BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(40),
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
              Image.asset("assets/images/produit.png",fit:BoxFit.cover,width: double.infinity,),
              const SizedBox(height: 11,),
              const Text("Racine Vita Huile Graine",style: TextStyle(color:GlobalColors.textColor),),
              Container(
                margin:const EdgeInsets.only(left:30),
                child: Row(children: const [
                Text("50",style: TextStyle(color:GlobalColors.textColor),),
                SizedBox(width: 10,),
                Text("MAD",style: TextStyle(color:GlobalColors.myColor),),
              ],),),
              const SizedBox(
                height: 12,
              ),
        SizedBox(
        width: 150,
        height: 30,
       child: 
       ElevatedButton(
         style: ElevatedButton.styleFrom(
           backgroundColor:GlobalColors.myColor3,
           padding: const EdgeInsets.symmetric(vertical: 16.0),
           //definir un border radius pour ce btn
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10),
           ),
         ),
         onPressed:(){},
         child:const Text("Buy Now",
           style:TextStyle(
             color:Colors.white,
             fontWeight: FontWeight.w500
           ),
         ),
       ),
        ),
            ]),
            ),
           Container(
                width: 200,
                height: 300,
               decoration:BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(40),
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
              Image.asset("assets/images/produit.png",fit:BoxFit.cover,width: double.infinity,),
              const SizedBox(height: 11,),
              const Text("Racine Vita Huile Graine",style: TextStyle(color:GlobalColors.textColor),),
              Container(
                margin:const EdgeInsets.only(left:30),
                child: Row(children: const [
                Text("50",style: TextStyle(color:GlobalColors.textColor),),
                SizedBox(width: 10,),
                Text("MAD",style: TextStyle(color:GlobalColors.myColor),),
              ],),),
              const SizedBox(
                height: 12,
              ),
        SizedBox(
        width: 150,
        height: 30,
       child: 
       ElevatedButton(
         style: ElevatedButton.styleFrom(
           backgroundColor:GlobalColors.myColor3,
           padding: const EdgeInsets.symmetric(vertical: 16.0),
           //definir un border radius pour ce btn
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10),
           ),
         ),
         onPressed:(){},
         child:const Text("Buy Now",
           style:TextStyle(
             color:Colors.white,
             fontWeight: FontWeight.w500
           ),
         ),
       ),
        ),
            ]),
            ),
             Container(
                width: 200,
                height: 300,
               decoration:BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(40),
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
              Image.asset("assets/images/produit.png",fit:BoxFit.cover,width: double.infinity,),
              const SizedBox(height: 11,),
              const Text("Racine Vita Huile Graine",style: TextStyle(color:GlobalColors.textColor),),
              Container(
                margin:const EdgeInsets.only(left:30),
                child: Row(children: const [
                Text("50",style: TextStyle(color:GlobalColors.textColor),),
                SizedBox(width: 10,),
                Text("MAD",style: TextStyle(color:GlobalColors.myColor),),
              ],),),
              const SizedBox(
                height: 12,
              ),
        SizedBox(
        width: 150,
        height: 30,
       child: 
       ElevatedButton(
         style: ElevatedButton.styleFrom(
           backgroundColor:GlobalColors.myColor3,
           padding: const EdgeInsets.symmetric(vertical: 16.0),
           //definir un border radius pour ce btn
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10),
           ),
         ),
         onPressed:(){},
         child:const Text("Buy Now",
           style:TextStyle(
             color:Colors.white,
             fontWeight: FontWeight.w500
           ),
         ),
       ),
        ),
            ]),
            ),
          
          
            ],
            ),
         ),
         
            
      ),
    );
  }
}
