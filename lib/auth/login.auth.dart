import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/auth/register.auth.dart';
import 'package:stocktracker/view/widget/input.dart';
import 'package:stocktracker/view/widget/mybutton.global.dart';
import 'package:stocktracker/view/widget/mysocial.login.dart';
import '../utils/global.colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwdController = TextEditingController();
  // ignore: non_constant_identifier_names
  void Login() {
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
                  "assets/images/loginimg.png",
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                //MySocilaLogin c'est un classe declarer dans le package widget  contient trois btn (fb,twitter,google)
                const MySocialLogin(),
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
              "You don’t have an account?",
              style: TextStyle(color: GlobalColors.textColor),
            ),
            InkWell(
              onTap: ()  => Get.off(const Register()),
              child: const Text(
                "Registre",
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
