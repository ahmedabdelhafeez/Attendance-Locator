import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/shimmer_text_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/monthly_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/text_title_widget.dart';
import 'package:attendance_and_departure/features/report/presentation/provider/report_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class MonthPage extends StatefulWidget {
  const MonthPage({super.key});

  @override
  State<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  @override
  Widget build(BuildContext context) {
    ReportProvider reportProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 5.h,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.w))),
             backgroundColor: const Color.fromARGB(255, 53, 52, 52),
            leading: SizedBox.shrink(),
            title: TextTitleWidget(
              text: 'تفاصيل الشهر',
              color: [Colors.white, Colors.white],
              textStyle: TextStyleClass.semiBoldStyle(shadow: [
                Shadow(
                  offset: Offset(4.0, 4.0), // Position of the shadow
                  blurRadius: 6.0, // How much the shadow is blurred
                  color: Colors.white.withOpacity(0.4), // Shadow color
                ),
              ]),
            )),
        body: reportProvider.attendancesDetails == null
            ? Center(
                child: Transform.scale(
                    scale: 2,
                    child: const CupertinoActivityIndicator(
                      color: Colors.black,
                    )))
            : reportProvider.attendancesDetails!.length != 0
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // SizedBox(height: 10.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: <Widget>[
                        //     TextTitleWidget(
                        //       text: 'تفاصيل الشهر',
                        //       textStyle: TextStyleClass.semiBoldStyle(shadow: [
                        //         Shadow(
                        //           offset: Offset(4.0, 4.0), // Position of the shadow
                        //           blurRadius: 6.0, // How much the shadow is blurred
                        //           color: Colors.grey.withOpacity(0.4), // Shadow color
                        //         ),
                        //       ]),
                        //     )
                        //   ],
                        // ),
                        ...List.generate(reportProvider.attendancesDetails!.length, (index) {
                          return MonthlyWidget(
                            attendancesDetails: reportProvider.attendancesDetails![index],
                          );
                        })
                      ],
                    ),
                  )
                : Center(
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
                    ),
                  ));
  }
}
