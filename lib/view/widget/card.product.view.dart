import 'package:flutter/material.dart';
import 'package:stocktracker/utils/global.colors.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.onPressed,
    required this.productTitle, required this.price,
  });
  final void Function() onPressed;
  final String productTitle;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: [
        Image.asset(
          "assets/images/produit.png",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          productTitle,
          style: const TextStyle(color: GlobalColors.textColor),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Text(
                price,
                style: const TextStyle(color: GlobalColors.textColor),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "MAD",
                style: TextStyle(color: GlobalColors.myColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //btn
        SizedBox(
          width: 150,
          height: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: GlobalColors.myColor3,
              //definir un border radius pour ce btn
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              "Buy Now",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
