import 'package:flutter/material.dart';

class ContainerHome extends StatelessWidget {
  const ContainerHome(
      {super.key,
      required this.assetImage,
      required this.onTap,
      required this.color,
      required this.text});
  final AssetImage assetImage;
  final VoidCallback onTap;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(4),
        height: 177,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset:const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Image(image:assetImage,
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 10,
            ),
           Text(
              text,
              style: TextStyle(color: color, fontSize: 18,fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
    // return Center(
    //   child: GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //    height: 177,
    //    width: 160,
    //   // Propriétés du container
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(15),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.grey.withOpacity(0.5),
    //         spreadRadius: 2,
    //         blurRadius: 5,
    //         offset:const Offset(0, 3), // changes position of shadow
    //       ),
    //     ],
    //   ),
    //   child: Row(
    //     children: [
    //       // Image
    //       Column(
    //         children: [
    //           Image(
    //         image:assetImage,
    //         width: 120.0,
    //         height: 120.0,
    //       ),
    //       const SizedBox(height: 10.0), // Espace entre l'image et le texte
    //       // Texte
    //       Text(
    //         text,
    //         style: TextStyle(color:color,fontSize: 18,fontWeight: FontWeight.w600
    //         ),
    //         )
    //         ],
    //       )
    //     ],
    //   ),
    //   ),
    // ),
    // );
  }
}
