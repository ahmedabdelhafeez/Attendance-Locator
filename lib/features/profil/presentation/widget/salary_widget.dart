import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/item_dateail_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/text_title_widget.dart';
import 'package:attendance_and_departure/features/report/presentation/provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SalaryWidget extends StatelessWidget {
  const SalaryWidget({super.key});
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
               Icon(Icons.money,size: 7.w,color: Colors.orangeAccent,),
              SizedBox(width: 2.w,),
              TextTitleWidget(
                text: 'معلومات الراتب',
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
                          title: 'الراتب الأساسي',
                          corlor: [Colors.white, Colors.white],
                          text: reportProvider.reportEntity!.mainSalary.toString() + ' جنيهاً',
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title:  'الراتب اليومي',
                          corlor: [Colors.white, Colors.white],
                          text: reportProvider.reportEntity!.dailySalary.toString() + ' جنيهاً',
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'أجر الساعة',
                          corlor: [Colors.white, Colors.white],
                          text: reportProvider.reportEntity!.hourSalary.toString() + ' جنيهاً',
                          textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
                        ),
                        ItemDateailWidget(
                          title: 'أجر الدقيقة',
                          corlor: [Colors.white, Colors.white],
                          text: reportProvider.reportEntity!.deductionForLateMinutes.toString() + ' جنيهاً',
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
//  ItemDateailWidget(
//                           title: 'راتب إضافي عن الوقت الإضافي',
//                           corlor: [Colors.white, Colors.white],
//                           text: reportProvider.reportEntity!.additionalSalaryForExtraTime.toString() + ' جنيهاً',
//                           textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
//                         ),
//                         ItemDateailWidget(
//                           title: 'الراتب بعد خصم ساعات التأخير',
//                           corlor: [Colors.white, Colors.white],
//                           text: reportProvider.reportEntity!.salaryAfterLateHours.toString() + ' جنيهاً',
//                           textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
//                         ),
//                         ItemDateailWidget(
//                           title: 'الراتب بعد ساعات العمل الإضافية',
//                           corlor: [Colors.white, Colors.white],
//                           text: reportProvider.reportEntity!.overTimeMinutes.toString() + ' جنيهاً',
//                           textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
//                         ),
//                         ItemDateailWidget(
//                           title: 'مدة العمل الإضافي العامل',
//                           corlor: [Colors.white, Colors.white],
//                           text: reportProvider.reportEntity!.salaryAfterExtraTimeWorked.toString() + ' جنيهاً',
//                           textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
//                         ),
//                         ItemDateailWidget(
//                           title: 'الراتب المتبقي',
//                           corlor: [Colors.white, Colors.white],
//                           text: reportProvider.reportEntity!.remainSalary.toString() + ' جنيهاً',
//                           textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
//                         ),
//                         ItemDateailWidget(
//                           title: 'الراتب الحالي',
//                           corlor: [Colors.white, Colors.white],
//                           text: reportProvider.reportEntity!.currentSalary.toString() + ' جنيهاً',
//                           textStyle: TextStyleClass.normalBoldStyle(color: Colors.white),
//                         ),