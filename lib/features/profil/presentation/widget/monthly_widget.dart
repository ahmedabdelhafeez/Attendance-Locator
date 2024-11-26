import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/helper_function/convert_houer.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/item_dateail_widget.dart';
import 'package:attendance_and_departure/features/report/domain/entities/report_entity.dart';
import 'package:attendance_and_departure/features/report/presentation/provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MonthlyWidget extends StatelessWidget {
  const MonthlyWidget({super.key, required this.attendancesDetails});
  final AttendancesDetails attendancesDetails;
  @override
  Widget build(BuildContext context) {
    ReportProvider reportProvider = Provider.of<ReportProvider>(context);
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Column(
        children: <Widget>[
          SizedBox(height: 1.h),
          reportProvider.reportEntity != null
              ? Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
                  elevation: 2.w,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        gradient: LinearGradient(begin: AlignmentDirectional.centerStart, end: AlignmentDirectional.bottomEnd, colors: [
                          Colors.orange,
                          Colors.black,
                        ])),
                    child: Column(
                      children: <Widget>[
                        ItemDateailWidget(
                          title: 'التاريخ',
                          corlor: [Colors.white, Colors.white],
                          text: attendancesDetails.date.toString(),
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'اليوم',
                          corlor: [Colors.white, Colors.white],
                          text: attendancesDetails.day.toString(),
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'وقت تسجيل الحضور',
                          corlor: [Colors.white, Colors.white],
                          text: toDisplayFormat(attendancesDetails.checkInTime),
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'وقت تسجيل الامصراف',
                          corlor: [Colors.white, Colors.white],
                          text:attendancesDetails.checkOutTime!=null?toDisplayFormat(attendancesDetails.checkOutTime!):'منتظر',
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'عدد ساعات العمل الكلية',
                          corlor: [Colors.white, Colors.white],
                          text: attendancesDetails.totalWorkHours,
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'وقت التاخير',
                          corlor: [Colors.white, Colors.white],
                          text: convertToHoursAndMinutes(attendancesDetails.lateMinutes),
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'وقت العمل الاضافي',
                          corlor: [Colors.white, Colors.white],
                          text: convertToHoursAndMinutes(attendancesDetails.overTimeMinutes),
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
