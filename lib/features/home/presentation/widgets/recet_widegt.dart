import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/shimmer_text_widget.dart';
import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/five_day_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/page/month_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class RecentWidegt extends StatelessWidget {
  const RecentWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    AttendanceProvider attendanceProvider = Provider.of<AttendanceProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Material(
        elevation: 20.w,
        color: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(7.w), topRight: Radius.circular(7.w)),
        ),
        child: Container(
          width: 100.w,
          decoration: BoxDecoration(
            //     border: Border(top: BorderSide(color: Colors.black.withOpacity(0.1), width: 2.w)),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(7.w), topRight: Radius.circular(7.w)),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: attendanceProvider.listTodayAttendaceModel == null
                  ? Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Transform.scale(
                            scale: 2,
                            child: const CupertinoActivityIndicator(
                              color: Colors.black,
                            )),
                      ],
                    )
                  : attendanceProvider.listLastSixDaysEntity.length == 0
                      ? Center(
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 5.w,
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(Images.eslamLogo),
                            ),
                            SizedBox(width: 2.w),
                            ShimmerTextWidget(
                                gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
                                child: Text(
                                  'لايوجد اي انشطة بعد...!',
                                  style: TextStyleClass.semiBoldStyle(color: Colors.black),
                                ),
                                shimmerDirection: ShimmerDirection.btt,
                                enabled: false),
                          ],
                        ))
                      : Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              ShimmerTextWidget(
                                  gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
                                  child: Text(
                                    'ٌالأنشطة الأخيرة',
                                    style: TextStyleClass.semiBoldStyle(color: Colors.black),
                                  ),
                                  shimmerDirection: ShimmerDirection.btt,
                                  enabled: false),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    Constants.globalContext(),
                                    PageTransition(
                                      curve: Curves.easeIn,
                                      duration: Duration(milliseconds: 700),
                                      type: PageTransitionType.bottomToTop, // You can change this to different types
                                      child: MonthPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'المزيد',
                                  style: TextStyleClass.normalBoldStyle(color: Colors.black.withOpacity(0.6)),
                                ),
                              )
                            ],
                          ),
                          ...List.generate(attendanceProvider.listLastSixDaysEntity.length, (index) {
                            return Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(),
                                child: FiveDayWidget(
                                  todayAttendanceEntity: attendanceProvider.listLastSixDaysEntity[index],
                                ));
                          })
                        ])),
        ),
      ),
    );
  }
}
