import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocktracker/auth/login.auth.dart';
import 'package:stocktracker/auth/register.auth.dart';
import 'package:stocktracker/auth/select.auth.dart';
import 'package:stocktracker/utils/global.colors.dart';
import 'package:stocktracker/view/Product.view.dart';
import 'package:stocktracker/view/add.product.view.dart';
import 'package:stocktracker/view/add.supplier.view.dart';
import 'package:stocktracker/view/dashboard.view.dart';
import 'package:stocktracker/view/home.view.dart';
import 'package:stocktracker/view/infos.view.dart';
import 'package:stocktracker/view/languages.view.dart';
import 'package:stocktracker/view/lowStock.view.dart';
import 'package:stocktracker/view/spalsh.view.dart';
import 'package:stocktracker/view/stock.view.dart';
import 'package:stocktracker/view/supplier.view.dart';
import 'package:stocktracker/view/update.product.view.dart';
import 'package:stocktracker/view/update.supplier.view.dart';
import 'package:stocktracker/view/view.product.stock.view.dart';
import 'package:stocktracker/view/view.supplier.view.dart';
import 'package:stocktracker/locale/locale_controller.dart';
import 'locale/translation.dart';

late SharedPreferences sharedPref;
SharedPreferences? sharepref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  sharepref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: GlobalColors.myColor,
      ),
      // home: const SplashView(),
      initialRoute: sharedPref.getString("user_id")==null ? "splashView" :"home" ,
      routes: {
        "home": (context) => const HomePage(),
        "selectAuth": (context) => const SelectAuth(),
        "login": (context) => const Login(),
        "register": (context) => const Register(),
        "lowStock": (context) => const LowStock(),
        "stock": (context) => const Stock(),
        "supplier": (context) => const Supplier(),
        "product": (context) => const Product(),
        "dashboard": (context) => const Dashboard(),
        "infos": (context) => const Infos(),
        "addProduct": (context) => const AddProduct(),
        "viewProduct": (context) => const ViewProduct(),
        "updateProduct": (context) => const UpdateProduct(),
        "addSupplier": (context) => const AddSupplier(),
        "viewSupplier": (context) => const ViewSupplier(),
        "updateSupplier": (context) => const UpdateSupplier(),
        "splashView":(context) => const SplashView(),
        "languages":(context)=>const Language(),
      },
       translations: Translation(),
      locale: controller.initialLang,
      fallbackLocale: const Locale("en"),
      debugShowCheckedModeBanner: false,
    );
  }
}
