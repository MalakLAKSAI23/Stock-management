import 'package:flutter/material.dart';

class SocialBtn extends StatelessWidget {
  const SocialBtn({super.key, required this.assetImage, required this.onTap});
  final AssetImage assetImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap:onTap,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(image: assetImage, fit: BoxFit.cover)),
      ),
    );
  }
}
