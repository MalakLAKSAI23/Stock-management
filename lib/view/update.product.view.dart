import 'package:flutter/material.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/widget/drawer.dart';
import 'package:stocktracker/view/widget/inputview.dart';
import 'package:stocktracker/view/widget/mybutton.global.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return UpdateProductState();
  }
}

class UpdateProductState extends State<UpdateProduct> {
  String? _selectedValue;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _quantityController = TextEditingController();
  final _minController = TextEditingController();
  final _priceController = TextEditingController();


  // ignore: non_constant_identifier_names
  void UpdateProduct() {
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
                      "assets/images/produit.png",
                      height: 250,
                      width: 250,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Update Product',
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
                            return 'Enter product name';
                          }
                          return null;
                        },
                        controller: _nameController),
                    const SizedBox(
                      height: 12,
                    ),
                    InputView(
                        hint: "description",
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter product description';
                          }
                          return null;
                        },
                        controller: _descriptionController),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputView(
                              hint: "quantity",
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter quantity in stock';
                                }
                                return null;
                              },
                              controller: _quantityController),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: InputView(
                              hint: "min",
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter product min';
                                }
                                return null;
                              },
                              controller: _minController),
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
                              hint: "price",
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter price';
                                }
                                return null;
                              },
                              controller: _priceController),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: 
                          DropdownButton(
                            value:
                                _selectedValue, // Valeur sélectionnée actuelle
                            items:const [
                              DropdownMenuItem(
                                value: 'MALAK LAKSAI',
                                child: Text('MalakLAKSAI'),
                              ),
                              DropdownMenuItem(
                                value: 'supplier1',
                                child: Text('Supplier 1'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedValue =value!; // Met à jour la valeur sélectionnée
                              });
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
                        Expanded(child: MyButton(color: Colors.blueGrey, onPressed: () { Navigator.of(context).pushNamed("stock"); }, text: 'Cancel', textColor: Colors.white,)),
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
