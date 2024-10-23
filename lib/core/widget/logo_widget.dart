import 'package:flutter/material.dart';
import '../constants/images.dart';
class LogoWidget extends StatelessWidget {
  final double? width,height;
  const LogoWidget({this.height,this.width,super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Images.logoImage,width: width,height: height,fit:BoxFit.contain,),
      ],
    );
  }
}
