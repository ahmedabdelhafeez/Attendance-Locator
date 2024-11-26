import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/helper_function/convert_houer.dart';
import 'package:attendance_and_departure/core/widget/shimmer_text_widget.dart';
import 'package:attendance_and_departure/features/attendance/domain/entities/today_attendance_entity.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class FiveDayWidget extends StatelessWidget {
  const FiveDayWidget({super.key, required this.todayAttendanceEntity});
  final TodayAttendanceEntity todayAttendanceEntity;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
      elevation: 1.w,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.w), color: Color(0xfff6f7f9)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShimmerTextWidget(
                  gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
                  shimmerDirection: ShimmerDirection.ttb,
                  enabled: false,
                  child: Text(
                    '${todayAttendanceEntity.day} : ${todayAttendanceEntity.date}',
                    style: TextStyleClass.normalBoldStyle(color: const Color.fromARGB(255, 113, 154, 161)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                ShimmerTextWidget(
                  gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
                  shimmerDirection: ShimmerDirection.ttb,
                  enabled: false,
                  child: Text(
                    'وقت الحضور : ',
                    style: TextStyleClass.normalBoldStyle(color: Colors.black),
                  ),
                ),
                Spacer(),
                Text(
                  '${toDisplayFormat(todayAttendanceEntity.checkInTime)}',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
              ],
            ),
            ShimmerTextWidget(
              gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
              shimmerDirection: ShimmerDirection.ttb,
              enabled: false,
              child: Row(
                children: [
                  Text(
                    'وقت الانصراف : ',
                    style: TextStyleClass.normalBoldStyle(color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    todayAttendanceEntity.checkOutTime==null?'منتظر':
                    '${toDisplayFormat(todayAttendanceEntity.checkOutTime!)}',
                    style: TextStyleClass.normalBoldStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            ShimmerTextWidget(
              gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
              shimmerDirection: ShimmerDirection.ttb,
              enabled: false,
              child: Row(
                children: [
                  Text(
                    'متأخر : ',
                    style: TextStyleClass.normalBoldStyle(color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    convertToHoursAndMinutes(todayAttendanceEntity.lateMinutes),
                    // '${todayAttendanceEntity.lateMinutes} دقيقة',
                    style: TextStyleClass.normalBoldStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            ShimmerTextWidget(
              gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
              shimmerDirection: ShimmerDirection.ttb,
              enabled: false,
              child: Row(
                children: [
                  Text(
                    'مبكراً : ',
                    style: TextStyleClass.normalBoldStyle(color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                  convertToHoursAndMinutes(todayAttendanceEntity.earlyMinutes),
                    style: TextStyleClass.normalBoldStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ShimmerTextWidget(
                  gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
                  shimmerDirection: ShimmerDirection.ttb,
                  enabled: false,
                  child: Text(
                    ' مكان تسجيل الحضور : ',
                    style: TextStyleClass.normalBoldStyle(color: Colors.black),
                  ),
                ),
                Spacer(),
                Text(
                  '${todayAttendanceEntity.checkInLocationName ?? 'منتظر'}',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                ShimmerTextWidget(
                  gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
                  shimmerDirection: ShimmerDirection.ttb,
                  enabled: false,
                  child: Text(
                    ' مكان تسجيل الانصراف : ',
                    style: TextStyleClass.normalBoldStyle(color: Colors.black),
                  ),
                ),
                Spacer(),
                Text(
                  '${todayAttendanceEntity.checkOutLocationName ?? 'منتظر'}',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
