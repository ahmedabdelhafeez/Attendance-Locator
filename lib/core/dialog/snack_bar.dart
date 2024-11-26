import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:sizer/sizer.dart';

void showToast(String text,{Color? color}) {
  Fluttertoast.showToast(
    msg: LanguageProvider.translate('warning', text),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    //timeInSecForIosWeb: 6,
    backgroundColor: color ?? const Color.fromARGB(255, 249, 3, 3),
    textColor: Colors.white,
    fontSize: 10.sp,
  );
}
