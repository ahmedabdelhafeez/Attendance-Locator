import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/features/attendance/domain/entities/today_attendance_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FiveDayWidget extends StatelessWidget {
  const FiveDayWidget({super.key,required this.lastFiveDaysEntity});
  final LastFiveDaysEntity lastFiveDaysEntity;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
      elevation: 1.w,
      child: Container(
        padding:EdgeInsets.all(4.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.w),
        color: Color(0xfff6f7f9)
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'اليوم : ${lastFiveDaysEntity.date}',
                  style: TextStyleClass.normalBoldStyle(color: const Color.fromARGB(255, 113, 154, 161)),
                ),
              ],
            ),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Text(
                  'وقت الحضور : ',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
                Spacer(),
                Text(
                  '${lastFiveDaysEntity.checkInTime}',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'وقت الانصراف : ',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
                Spacer(),
                Text(
                  '${lastFiveDaysEntity.checkOutTime}',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'متأخر : ',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
                Spacer(),
                Text(
                  '${lastFiveDaysEntity.lateMinutes} دقيقة',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
              ],
            ),
             Row(
              children: [
                Text(
                  'مبكراً : ',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
                Spacer(),
                Text(
                 '${lastFiveDaysEntity.earlyMinutes} دقيقة',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
              ],
            ),
             Row(
              children: [
                Text(
                  'دقائق العمل الاضافية : ',
                  style: TextStyleClass.normalBoldStyle(color: Colors.black),
                ),
                Spacer(),
                Text(
                  '${lastFiveDaysEntity.extraMinutesWorked} دقيقة',
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
