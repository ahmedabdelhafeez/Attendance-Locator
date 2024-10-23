


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_color.dart';

void showToast(String text){
  Fluttertoast.showToast(
    msg: LanguageProvider.translate('warning', text),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    //timeInSecForIosWeb: 6,
    backgroundColor: const Color.fromARGB(255, 2, 106, 4),
    textColor: Colors.white,
    fontSize: 10.sp,
  );
}