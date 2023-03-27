import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal(
      {Key? key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscure, required this.icon})
      : super(key: key);
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return 
    TextFormField(
      controller: controller,
      validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
      keyboardType: textInputType,
      obscureText: obscure,
      decoration:InputDecoration(
        hintText:text,
        prefixIcon:icon,
          border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),
                          )
        // border: InputBorder.none,
        // contentPadding: EdgeInsets.all(0),
      ),
    );
  }
}
