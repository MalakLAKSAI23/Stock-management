import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/auth/login.auth.dart';
import 'package:stocktracker/auth/register.auth.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/mybutton.global.dart';
import 'package:stocktracker/view/widget/mysocial.login.dart';

class SelectAuth extends StatelessWidget {
  const SelectAuth({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Choisir la langue de l'aplication FloatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: GlobalColors.myColor, //couleur blue
        onPressed: () {},
        child: const Icon(
          Icons.language_rounded,
          color: Colors.white,
        ),
      ),
      //container
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            //margin pour tout les elements
            margin: const EdgeInsets.only(
              left: 27,
              right: 27,
              bottom: 20,
            ),
            // Column organiser le contenu de l'interface utilisateur verticalement
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/auth.png",
                  width: 250,
                  height: 300,
                ),
                const SizedBox(
                  height: 10,
                ),
                //MyButton c'est un classe declarer dans le package widget
                //btn pour connexion
                MyButton(
                  text: "Login",
                  color: GlobalColors.myColor,
                  onPressed: () {
                     Get.off(const Login());
                  },
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //btn pour inscription
                MyButton(
                  text: "Create an Account",
                  color: const Color(0xFFF5F5F5),
                  onPressed: () {
                    Get.off(const Register());
                  },
                  textColor: GlobalColors.myColor,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                //MySocilaLogin c'est un classe declarer dans le package widget  contient trois btn (fb,twitter,google)
                const MySocialLogin(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        alignment: Alignment.center,
        child: const Text(
          "Stock Tracker",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
