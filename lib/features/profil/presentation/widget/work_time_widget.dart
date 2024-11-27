import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/helper_function/convert_houer.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/item_dateail_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/text_title_widget.dart';
import 'package:attendance_and_departure/features/report/presentation/provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class WorkTimeWidget extends StatelessWidget {
  const WorkTimeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    ReportProvider reportProvider = Provider.of<ReportProvider>(context);
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.timelapse,size: 7.w, color: Colors.orangeAccent,),
              SizedBox(width: 2.w,),
              TextTitleWidget(
                text: 'إحصائيات العمل',
                textStyle: TextStyleClass.semiBoldStyle(shadow: [
                  Shadow(
                    offset: Offset(4.0, 4.0), // Position of the shadow
                    blurRadius: 6.0, // How much the shadow is blurred
                    color: Colors.grey.withOpacity(0.4), // Shadow color
                  ),
                ]),
              )
            ],
          ),
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
                          title: 'ايام الحضور',
                          corlor: [Colors.white, Colors.white],
                          text: reportProvider.reportEntity!.attendDays.toString() + ' يوماً',
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'ايام الغياب',
                          corlor: [Colors.white, Colors.white],
                          text: reportProvider.reportEntity!.absentDays.toString() + ' يوماً',
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'وقت التاخير',
                          corlor: [Colors.white, Colors.white],
                          text: convertToHoursAndMinutes(reportProvider.reportEntity!.lateMinutes),
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'مدة العمل الإضافي',
                          corlor: [Colors.white, Colors.white],
                          text: convertToHoursAndMinutesStringWork(reportProvider.reportEntity!.overTime),
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'مدة الوقت غير العامل',
                          corlor: [Colors.white, Colors.white],
                          text: convertToHoursAndMinutesStringWork(reportProvider.reportEntity!.notWorkingTime),
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
