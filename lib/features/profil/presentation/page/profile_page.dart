import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/features/home/presentation/pages/home_page.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/header_widegt.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/discouunt_and_addition_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/salary_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/text_title_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/work_time_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/worker_details_widget.dart';
import 'package:attendance_and_departure/features/report/presentation/provider/report_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../config/text_style.dart';

class ProfilePAge extends StatelessWidget {
  ProfilePAge({super.key});
  @override
  Widget build(BuildContext context) {
    // UserProfileProvider userProfileProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 5.h,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.w))),
          backgroundColor: const Color.fromARGB(255, 53, 52, 52),
          leading: SizedBox.shrink(),
          title: TextTitleWidget(
            text: 'الملف الشخصي',
            color: [Colors.white, Colors.white],
            textStyle: TextStyleClass.semiBoldStyle(shadow: [
              Shadow(
                offset: Offset(4.0, 4.0), // Position of the shadow
                blurRadius: 6.0, // How much the shadow is blurred
                color: Colors.white.withOpacity(0.4), // Shadow color
              ),
            ]),
          )),
      body: Container(
        width: 100.w,
        height: 100.h,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            //    SizedBox(height: 10.h),
            HeaderWidegt(
              onTap: () {
                Navigator.pop(
                  Constants.globalContext(),
                  PageTransition(
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.topToBottom, // You can change this to different types
                    child: HomePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 1.h),
            Provider.of<ReportProvider>(context, listen: true).reportEntity == null
                ? Center(
                    child: Transform.scale(
                        scale: 2,
                        child: const CupertinoActivityIndicator(
                          color: Colors.black,
                        )))
                : Column(
                    children: <Widget>[
                      WorkerDetailsWidget(),
                      WorkTimeWidget(),
                      SalaryWidget(),
                      DiscouuntAndAdditionWidget()
                    ],
                  )
          ]),
        ),
      ),
    );
  }
}
