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

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return AddProductState();
  }
}

class AddProductState extends State<AddProduct> with Crud {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final minController = TextEditingController();
  final priceController = TextEditingController();
  bool isLoading = false;
  String selectedValue = "";

  // ignore: non_constant_identifier_names
  addProduct() async {
    var response = await postRequest(linkAddProduct, {
      "name_p": nameController.text,
      "description_p": descriptionController.text,
      "quantite_p": quantityController.text,
      "min_p": minController.text,
      "price_p": priceController.text,
      "id_s": selectedValue,
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
            onPressed: () => Navigator.of(context).pushNamed("addProduct"),
            child: Text("cancel".tr, style: TextStyle(color: Colors.white)),
          ),
          title: "alert".tr,
          body:Text("addFailed".tr))
        ..show();
    } else {
      Navigator.of(context)
          .restorablePushNamedAndRemoveUntil("stock", (route) => false);
    }
  }

  getSupplier() async {
    var response = await postRequest(
        linkViewSupplier, {"user_id": sharedPref.getString("user_id")});
    return response;
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
                      "assets/images/addpro.png",
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'addPro'.tr,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: GlobalColors.myColor, fontSize: 25),
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
                        controller: nameController),
                    const SizedBox(
                      height: 12,
                    ),
                    InputView(
                        hint: "description",
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enterDescription'.tr;
                          }
                          return null;
                        },
                        controller: descriptionController),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputView(
                              hint: "quantity".tr,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enterQuantite'.tr;
                                }
                                return null;
                              },
                              controller: quantityController),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: InputView(
                              hint: "min".tr,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enterMin'.tr;
                                }
                                return null;
                              },
                              controller: minController),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputView(
                              hint: "price".tr,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enterPrice'.tr;
                                }
                                return null;
                              },
                              controller: priceController),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: FutureBuilder(
                            future: getSupplier(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.data != null &&
                                  snapshot.data['data'] != null) {
                                return DropdownButton(
                                    items: List.generate(
                                        snapshot.data['data']?.length ?? 0,
                                        (index) {
                                      var supplier =
                                          snapshot.data['data'][index];
                                      return DropdownMenuItem(
                                          value: supplier['id_s'],
                                          child: Text("${supplier['name_s']}"));
                                    }),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value.toString();
                                      });
                                    });
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: GlobalColors.myColor,
                                  ),
                                );
                              } else {
                                return  Expanded(
                                  child: Center(
                                    child: Text("addSupFirst".tr),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: MyButton(
                          color: Colors.blueGrey,
                          onPressed: () {
                            Navigator.of(context).pushNamed("stock");
                          },
                          text: 'cancel'.tr,
                          textColor: Colors.white,
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: MyButton(
                          color: GlobalColors.myColor,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Si le formulaire est valide, enregistrer les valeurs
                              // _formKey.currentState!.save();
                              await addProduct();

                              // Les informations d'identification sont valides
                            } else {
                              // Les informations d'identification ne sont pas valides
                            }
                          },
                          text: 'Add',
                          textColor: Colors.white,
                        )),
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
