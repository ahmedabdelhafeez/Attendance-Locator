
import 'package:flutter/material.dart';

abstract class PaginationClass{
  late int pageIndex;
  late bool paginationStarted;
  late bool paginationFinished;
  void pagination(ScrollController controller,);
}