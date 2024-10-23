import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/dialog/confirm_dialog.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CheckWidegt extends StatelessWidget {
  const CheckWidegt({
    super.key,
  });
  // final CheckModel model;
  @override
  Widget build(BuildContext context) {
    AttendanceProvider attendanceProvider = Provider.of<AttendanceProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            confirmDialog(
                'هل انت متاكد من تسجيل الحضور',
                'تاكيد',
                () {
                  attendanceProvider.getCurrentLocation(0);
                  navPop();
                },
                cancel: 'الغاء',
                cancelTap: () {
                  navPop();
                });
          },
          child: Material(
            elevation: 1.w,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
            child: Container(
                width: 45.w,
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w), color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 5.w,
                          backgroundColor: Color(0xfff6f7f9),
                          child: Image.asset(
                            Images.checkIn,
                            width: 5.w,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'تسجيل الحضور',
                          style: TextStyleClass.normalBoldStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    attendanceProvider.todayEntity?.checkInTime != null
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 1.h),
                              Text(
                                attendanceProvider.todayEntity != null ? attendanceProvider.todayEntity!.date : 'لم يتم التسجيل بعد',
                                style: TextStyleClass.normalBoldStyle(color: Colors.black),
                              ),
                              Text(
                                attendanceProvider.todayEntity?.checkInTime ?? '',
                                style: TextStyleClass.normalBoldStyle(color: Colors.black),
                              ),
                              Text(
                                attendanceProvider.todayEntity?.checkInLocationName ?? 'المكان لم يحدد بعد',
                                style: TextStyleClass.smallBoldStyle(color: const Color.fromARGB(255, 83, 82, 82)),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                attendanceProvider.todayEntity != null
                                    ? attendanceProvider.todayEntity!.lateMinutes > 0
                                        ? 'متاخر : ${attendanceProvider.todayEntity?.lateMinutes} دقيقة'
                                        : 'مبكرا : ${attendanceProvider.todayEntity?.earlyMinutes} دقيقة'
                                    : '',
                                style: TextStyleClass.normalBoldStyle(
                                    color: attendanceProvider.todayEntity != null
                                        ? attendanceProvider.todayEntity!.lateMinutes > 0
                                            ? Colors.red
                                            : Colors.green
                                        : Colors.black),
                              )
                            ],
                          )
                        : Text(
                            'لم يتم التسجيل بعد',
                            style: TextStyleClass.normalBoldStyle(color: Colors.black),
                          ),
                  ],
                )),
          ),
        ),
        InkWell(
            onTap: () {
              confirmDialog(
                  'هل انت متاكد من تسجيل الانصراف',
                  'تاكيد',
                  () {
                    attendanceProvider.getCurrentLocation(1);
                    navPop();
                  },
                  cancel: 'الغاء',
                  cancelTap: () {
                    navPop();
                  });
            },
            child: Material(
              elevation: 1.w,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
              child: Container(
                width: 45.w,
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w), color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 5.w,
                          backgroundColor: Color(0xfff6f7f9),
                          child: Image.asset(
                            Images.checkOut,
                            width: 5.w,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'تسجيل الانصراف',
                          style: TextStyleClass.normalBoldStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    attendanceProvider.todayEntity?.checkOutTime != null
                        ? Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 1.h),
                              Text(
                                attendanceProvider.todayEntity != null ? attendanceProvider.todayEntity!.date : 'لم يتم التسجيل بعد',
                                style: TextStyleClass.normalBoldStyle(color: Colors.black),
                              ),
                              Text(
                                attendanceProvider.todayEntity?.checkOutTime ?? '',
                                style: TextStyleClass.normalBoldStyle(color: Colors.black),
                              ),
                              Text(
                                attendanceProvider.todayEntity?.checkOutLocationName ?? 'المكان لم يحدد بعد',
                                style: TextStyleClass.smallBoldStyle(color: const Color.fromARGB(255, 83, 82, 82)),
                              ),
                              // SizedBox(height: 0.5.h),
                              // Text(
                              //   attendanceProvider.todayEntity != null
                              //       ? attendanceProvider.todayEntity!.lateMinutes > 0
                              //           ? 'متاخر : ${attendanceProvider.todayEntity?.lateMinutes} دقيقة'
                              //           : 'مبكرا : ${attendanceProvider.todayEntity?.earlyMinutes} دقيقة'
                              //       : '',
                              //   style: TextStyleClass.normalBoldStyle(
                              //       color: attendanceProvider.todayEntity != null
                              //           ? attendanceProvider.todayEntity!.lateMinutes > 0
                              //               ? Colors.red
                              //               : Colors.green
                              //           : Colors.black),
                              // )
                            ],
                          )
                        : Text(
                            'لم يتم التسجيل بعد',
                            style: TextStyleClass.normalBoldStyle(color: Colors.black),
                          ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
