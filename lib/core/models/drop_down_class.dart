

import 'package:flutter/material.dart';

abstract class DropDownClass<T>{
  String displayedName();
  Widget? displayedOptionWidget();
  String displayedOptionName(T type);
  Future onTap(T? data);
  List<T> list();
  T? selected();
  dynamic value();
}