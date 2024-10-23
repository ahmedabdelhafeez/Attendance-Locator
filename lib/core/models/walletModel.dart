import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
class WalletModel {
String priceText;
String headText;
String hintText;
SvgWidget containerimage;
Color colorTextandcontainer;
WalletModel({required this.priceText,required this.headText,required this.hintText,required this.containerimage,required this.colorTextandcontainer});
}