import 'package:flutter/material.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/drawer.dart';
import 'package:stocktracker/view/widget/inputview.dart';
import 'package:stocktracker/view/widget/mybutton.global.dart';

class UpdateSupplier extends StatefulWidget {
  const UpdateSupplier({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return UpdateSupplierState();
  }
}

class UpdateSupplierState extends State<UpdateSupplier> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
 


  // ignore: non_constant_identifier_names
  void UpdateSupplier() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
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
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Add Supplier',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: GlobalColors.myColor, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InputView(
                        hint: "name",
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter name';
                          }
                          return null;
                        },
                        controller: _nameController),
                    const SizedBox(
                      height: 12,
                    ),
                    InputView(
                        hint: "email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter email';
                          }
                          return null;
                        },
                        controller: _emailController),
                    const SizedBox(
                      height: 12,
                    ),
                    InputView(
                              hint: "Phone number",
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter phone number';
                                }
                                return null;
                              },
                              controller: _phoneController),
                              const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: MyButton(color: Colors.blueGrey, onPressed: () {  }, text: 'Cancel', textColor: Colors.white,)),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(child: MyButton(color:GlobalColors.myColor, onPressed: () {  }, text: 'Update', textColor: Colors.white,)),

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
