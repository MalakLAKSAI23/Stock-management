// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktracker/locale/locale_controller.dart';
import 'package:stocktracker/utils/global.colors.dart';
class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerlang = Get.find();
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
          
        ),
       
      body: Container(
         margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
         child: Column(
         children:[
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          controllerlang.changeLang("fr");
                        // Action à effectuer lors du clic sur l'image
                        },
                        child: Image.asset(
                              "assets/images/france.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () {
                        controllerlang.changeLang("fr");
                      },
                      minWidth: 100,
                      textColor: Colors.black,
                      child: Text("fr".tr, textAlign: TextAlign.center),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          controllerlang.changeLang("en");
                        // Action à effectuer lors du clic sur l'image
                        },
                        child: Image.asset(
                              "assets/images/etats-unis.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () {
                        controllerlang.changeLang("en");
                      },
                      minWidth: 100,
                      child: Text("en".tr),
                    )
                  ],
                ),
              ),
            ],
          ),
        
          ]
          
        ),
      ),
    );
  }
}
