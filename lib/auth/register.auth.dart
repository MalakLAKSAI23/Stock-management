import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:stocktracker/components/crud.dart';
import 'package:stocktracker/components/linkapi.dart';
import 'package:stocktracker/main.dart';
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
  Crud crud = Crud();
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _passwdConfirmController = TextEditingController();
  signUp() async {
    isLoading = true;
    setState(() {
      
    });
    var response = await crud.postRequest(linkSignUp, {
      "email": emailController.text,
      "password": passwordController.text,
    });
      isLoading = false;
    setState(() {
      
    });
    if (response['status'] == "success") {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          btnCancel:MaterialButton(color: Colors.grey,onPressed: () => Navigator.of(context).pushNamed("register") ,child: Text("Cancel",style: TextStyle(color: Colors.white)),),
          title: "Alert",
          body: const Text("Registration Failed !!! Please try again later."))
        ..show();

    } else {
        Navigator.of(context).restorablePushNamedAndRemoveUntil("home", (route) => false);
         sharedPref.setString("id", response['data']['id'].toString());
         sharedPref.setString("email", response['data']['email']);
         sharedPref.setString("password", response['data']['password']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // onTap: () => Get.off(const Login()),
              onTap: () => Navigator.of(context).pushNamed("login"),

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
      body:isLoading==true ? Center(child: CircularProgressIndicator(color: GlobalColors.myColor,),) :Center(
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
                  controller: emailController,
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
                  controller: passwordController,
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
                    if (value != passwordController.text) {
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
                  text: "SignUp",
                  color: GlobalColors.myColor,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Si le formulaire est valide, enregistrer les valeurs
                      // _formKey.currentState!.save();
                      await signUp();

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
     );
  }
}
