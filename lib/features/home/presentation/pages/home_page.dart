import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/text_title_widget.dart';
import 'package:attendance_and_departure/features/report/presentation/provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/check_widegt.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/header_widegt.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/recet_widegt.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 5.h,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.w)),
          ),
          backgroundColor: const Color.fromARGB(255, 53, 52, 52),
          leading: SizedBox.shrink(),
          title: TextTitleWidget(
            text: 'الرئيسية',
            color: [Colors.white, Colors.white],
            textStyle: TextStyleClass.headBoldStyle(shadow: [
              Shadow(
                offset: Offset(4.0, 4.0), // Position of the shadow
                blurRadius: 6.0, // How much the shadow is blurred
                color: Colors.white.withOpacity(0.4), // Shadow color
              ),
            ]),
          )),
      backgroundColor: const Color(0xFFF6F7F9),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 4.w),
              HeaderWidegt(
                onTap: () {
                  Provider.of<ReportProvider>(context, listen: false).goToProfilePage();
                },
              ),
              const CheckWidget(),
              SizedBox(height: 2.h),
              const Expanded(
                child: RecentWidegt(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
