import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/components/crud.dart';
import 'package:stocktracker/components/linkapi.dart';
import 'package:stocktracker/main.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/drawer.dart';
import 'package:stocktracker/view/widget/inputview.dart';
import 'package:stocktracker/view/widget/mybutton.global.dart';

class AddSupplier extends StatefulWidget {
  const AddSupplier({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return AddSupplierState();
  }
}

class AddSupplierState extends State<AddSupplier> with Crud{
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  bool isLoading = false;


  // ignore: non_constant_identifier_names
  addSupplier() async {
    var response = await postRequest(linkAddSupplier, {
      "name_s": nameController.text,
      "email_s": emailController.text,
      "phone_s": phoneController.text,
      "user_id": sharedPref.getString("user_id"),
    });
    isLoading = false;
    setState(() {});
    if (response['status'] == "success") {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          btnCancel: MaterialButton(
            color: Colors.grey,
            onPressed: () => Navigator.of(context).pushNamed("addSupplier"),
            child: Text("cancel".tr, style: TextStyle(color: Colors.white)),
          ),
          title: "Alert",
          body: Text("addFailed".tr))
        ..show();
    } else {
      Navigator.of(context)
          .restorablePushNamedAndRemoveUntil("supplier", (route) => false);
    }
  }

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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/5.png",
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'addSup'.tr,
                      textAlign: TextAlign.center,
                      style:
                         const  TextStyle(color: GlobalColors.myColor, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InputView(
                        hint: "name".tr,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enterName'.tr;
                          }
                          return null;
                        },
                        controller:nameController),
                    const SizedBox(
                      height: 12,
                    ),
                    InputView(
                        hint: "email".tr,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enterEmail'.tr;
                          }
                          return null;
                        },
                        controller: emailController),
                    const SizedBox(
                      height: 12,
                    ),
                    InputView(
                              hint: "tel".tr,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enterTel';
                                }
                                return null;
                              },
                              controller:phoneController),
                              const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: MyButton(color: Colors.blueGrey, onPressed: () { Navigator.of(context).pushNamed("supplier"); }, text: 'cancel'.tr, textColor: Colors.white,)),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: MyButton(
                            color:GlobalColors.myColor,
                            onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Si le formulaire est valide, enregistrer les valeurs
                              // _formKey.currentState!.save();
                              await addSupplier();

                              // Les informations d'identification sont valides
                            } else {
                              // Les informations d'identification ne sont pas valides
                            }
                          },
                            text: 'add'.tr, textColor: Colors.white,)),

                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
