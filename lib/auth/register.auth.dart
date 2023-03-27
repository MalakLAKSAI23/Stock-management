import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/auth/login.auth.dart';
import 'package:stocktracker/view/widget/input.dart';
import 'package:stocktracker/view/widget/mybutton.global.dart';
import '../utils/global.colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return RegistreState();
  }
}

class RegistreState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwdController = TextEditingController();
  final _passwdConfirmController = TextEditingController();
  void register() {
    if (_formKey.currentState!.validate()) {
      // FirebaseAuth.instance.createUserWIthEmailAndPassword();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 20,
            ),
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(children: [
                Image.asset(
                  "assets/images/register.png",
                  width: 250,
                  height: 300,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login to your Account",
                      style: TextStyle(
                          color: GlobalColors.textColor,
                          fontWeight: FontWeight.w600),
                    )),
                const SizedBox(
                  height: 10,
                ),
                //Input c'est un classe declarer dans le package widget
                Input(
                  label: "Email",
                  hint: "email@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  isObscure: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: _emailController,
                ),

                const SizedBox(
                  height: 10,
                ),
                //Mot de passe
                Input(
                  label: "Password",
                  hint: "...........",
                  keyboardType: TextInputType.visiblePassword,
                  isObscure: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  controller: _passwdController,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                //confirme mdp
                Input(
                  label: "Confirm Password",
                  hint: "...........",
                  keyboardType: TextInputType.visiblePassword,
                  isObscure: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirmation de mot de passe requise';
                    }
                    if (value != _passwdController.text) {
                      return 'Le mot de passe ne correspond pas';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  controller: _passwdConfirmController,
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
                    if (_formKey.currentState!.validate()) {
                      // Si le formulaire est valide, enregistrer les valeurs
                      _formKey.currentState!.save();

                      // Les informations d'identification sont valides
                    } else {
                      // Les informations d'identification ne sont pas valides
                    }
                  },
                  textColor: Colors.white,
                ),
              ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You have an account?",
              style: TextStyle(color: GlobalColors.textColor),
            ),
            InkWell(
                onTap:() => Get.off(const Login()),
              child: const Text(
                "Login",
                style: TextStyle(
                  color: GlobalColors.myColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
