

import 'package:flutter/material.dart';

abstract class MultiDropDownClass<T>{
  String displayedName();
  String displayedOptionName(T type);
  Future onTap(List<T> data);
  Widget? displayedWidget();
  Widget? displayedOptionWidget(T type);
  List<T> list();
  List<T> selected();
  dynamic value();
}