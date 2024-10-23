import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/five_day_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RecentWidegt extends StatelessWidget {
  const RecentWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    AttendanceProvider attendanceProvider = Provider.of<AttendanceProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(7.w), topRight: Radius.circular(7.w)),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: SingleChildScrollView(
            child: attendanceProvider.listLastFiveDaysEntity.length == 0
                ? Center(
                    child: Text(
                      'لايوجد اي انشطة بعد...!',
                      style: TextStyleClass.normalBoldStyle(color: Colors.black),
                    ),
                  )
                : Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'ٌالأنشطة الأخيرة',
                            style: TextStyleClass.semiBoldStyle(color: Colors.black),
                          ),
                          Spacer(),
                          Text(
                            'المزيد',
                            style: TextStyleClass.normalStyle(color: Colors.black),
                          )
                        ],
                      ),
                      ...List.generate(attendanceProvider.listLastFiveDaysEntity.length, (index) {
                        return Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(),
                            child: FiveDayWidget(
                              lastFiveDaysEntity: attendanceProvider.listLastFiveDaysEntity[index],
                            ));
                      })
                    ],
                  )),
      ),
    );
  }
}
