import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'app_color.dart';
import 'text_style.dart';
ThemeData defaultTheme = ThemeData(
  useMaterial3: false,
  primaryColor: AppColor.defaultColor,
  unselectedWidgetColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  checkboxTheme:checkboxThemeData,
  radioTheme: radioThemeData,
  tabBarTheme: tabBarTheme,
  appBarTheme: appBarTheme1,
  splashColor: Colors.transparent,
);
// ThemeData defaultTheme1 = ThemeData(
//     useMaterial3: false,
//   primaryColor: AppColor.defaultColor,
//   unselectedWidgetColor: Colors.black,
//   scaffoldBackgroundColor: Colors.black,
//   checkboxTheme:checkboxThemeData,
//   radioTheme: radioThemeData,
//   tabBarTheme: tabBarTheme,
//   appBarTheme: appBarTheme2,
//   splashColor: Colors.transparent,
// );
AppBarTheme appBarTheme1 = AppBarTheme(
  color: Colors.white,
  centerTitle: true,
  foregroundColor: Colors.white,
  elevation: 0,
  toolbarHeight: 9.5.h,
  titleTextStyle: TextStyleClass.headBoldStyle(color: Colors.black),
);
AppBarTheme appBarTheme2 = AppBarTheme(
  color: Colors.black,
  centerTitle: true,
  foregroundColor: Colors.white,
  elevation: 0,
  toolbarHeight: 9.5.h,
  titleTextStyle: TextStyleClass.headBoldStyle(color: Colors.white),
);

CheckboxThemeData checkboxThemeData = CheckboxThemeData(
  fillColor: WidgetStateProperty.all<Color>(Colors.transparent),
  checkColor: WidgetStateProperty.all<Color>(AppColor.defaultColor),
  overlayColor: WidgetStateProperty.all<Color>(AppColor.defaultColor),
  visualDensity: VisualDensity.compact,
);

RadioThemeData radioThemeData = RadioThemeData(
  fillColor: WidgetStateProperty.all(AppColor.defaultColor),
);

TabBarTheme tabBarTheme = const TabBarTheme(
  labelColor: AppColor.defaultColor,
  indicatorSize: TabBarIndicatorSize.label,
  unselectedLabelColor: Colors.grey,
);


SystemUiOverlayStyle barColor(){
  if(Platform.isAndroid){
    return  SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white
    );
  }
  return SystemUiOverlayStyle.dark;
}
// ThemeData lightMode=ThemeData(
//   brightness: Brightness.light,
//   colorScheme:ColorScheme.light(
//   background: Colors.white,
//   primary: Colors.white,
//   secondary: Color(0xff005BA0),
//   secondaryFixed: Color(0xff8C0F96),
//   secondaryFixedDim: Color(0xffB8B8B8),
//   secondaryContainer: Color(0xfffA00000)
//   ,primaryFixed: Colors.black,
//   primaryContainer: const Color(0xff01249C),
  
//   )
// );
// ThemeData darkMode=ThemeData(
//   brightness: Brightness.dark,
//     colorScheme:ColorScheme.dark(
//   background: Colors.grey.shade900,
//   primary: Colors.grey.shade800,
//   secondary: Color.fromARGB(255, 95, 186, 255),
//   secondaryFixed: Color.fromARGB(255, 246, 123, 255),
//   secondaryFixedDim: Colors.white,
//   secondaryContainer: Color.fromARGB(255, 255, 59, 59),
//   primaryFixed: Colors.white,
//   primaryContainer: Color.fromARGB(255, 144, 170, 255)
//   )
// );
