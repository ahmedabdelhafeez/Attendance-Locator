import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/dialog/confirm_dialog.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
import 'package:attendance_and_departure/features/home/data/models/check_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeProvider extends ChangeNotifier {
  List<CheckModel> checkList = [
    CheckModel(
        time: Provider.of<AttendanceProvider>(Constants.globalContext(), listen: true).attendace
            ? Provider.of<AttendanceProvider>(Constants.globalContext(), listen: true).attendanceTime!
            : 'لم يتم التسجيل بعد',
        title: 'تسجيل الحضور',
        icon: Images.checkIn,
        onTap: () {
          confirmDialog(
              'هل انت متاكد من تسجيل الحضور',
              'تاكيد',
              () {
                Provider.of<AttendanceProvider>(Constants.globalContext(), listen: false).getCurrentLocation(0);
                navPop();
              },
              cancel: 'الغاء',
              cancelTap: () {
                navPop();
              });
        }),
    CheckModel(
        time: Provider.of<AttendanceProvider>(Constants.globalContext(), listen: true).depeture
            ? Provider.of<AttendanceProvider>(Constants.globalContext(), listen: true).dependanceTime!
            : 'لم يتم التسجيل بعد',
        title: 'تسجيل الانصراف',
        icon: Images.checkOut,
        onTap: () {
            confirmDialog(
              'هل انت متاكد من تسجيل الانصراف',
              'تاكيد',
              () {
              Provider.of<AttendanceProvider>(Constants.globalContext(), listen: false).getCurrentLocation(1);
                navPop();
              },
              cancel: 'الغاء',
              cancelTap: () {
                navPop();
              });
       
        }),
  ];
}
