
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/config/app_color.dart';

import '../constants/constants.dart';
Future<DateTime?> selectDate() async {
  final DateTime? picked = await showDatePicker(
    context: Constants.globalContext(),
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 3)),
    builder: (BuildContext context, child) {
      return Theme(
        data: Theme.of(context).copyWith(  // override MaterialApp ThemeData
          colorScheme: const ColorScheme.light(
            primary: AppColor.defaultColor,  //header and selced day background color
            onPrimary: Colors.white, // titles and
            onSurface: Colors.black, // Month days , years
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColor.defaultColor, // ok , cancel    buttons
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  return picked;
}

Future<TimeOfDay?> selectTime() async {
  TimeOfDay selectedTime = TimeOfDay.now();
  final TimeOfDay? picked = await showTimePicker(
    context: Constants.globalContext(),
    initialTime: selectedTime,
    builder: (BuildContext context, child) {
      return Theme(
        data: Theme.of(context).copyWith(  // override MaterialApp ThemeData
          colorScheme: const ColorScheme.light(
            primary: AppColor.defaultColor,  //header and selced day background color
            onPrimary: Colors.white, // titles and
            onSurface: Colors.black, // Month days , years
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColor.defaultColor, // ok , cancel    buttons
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  if (picked != null && picked != selectedTime) {
   return picked;
  }
  return null;
}

