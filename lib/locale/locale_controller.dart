import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:stocktracker/main.dart';

class MyLocaleController extends GetxController {
  Locale initialLang = sharepref!.getString("lang") == "en"
      ? const Locale("en")
      : const Locale("fr");
  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    sharepref!.setString("lang", codeLang);
    Get.updateLocale(locale);
  }
}
