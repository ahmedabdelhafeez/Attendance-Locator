import 'dart:ui';

import 'package:flutter/material.dart';

abstract class ProgressAbstract {
  late String title;
  late String svg;
  late int index;
}

abstract class SuperProgressAbstract {
  List<ProgressAbstract>? superList();
  Color getStepColor(int step);
}
