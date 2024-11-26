import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/dialog/confirm_dialog.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/helper_function/prefs.dart';
import 'package:attendance_and_departure/core/widget/shimmer_text_widget.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/features/auth/presentation/pages/login_page.dart';
import 'package:attendance_and_departure/features/home/presentation/pages/home_page.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/header_widegt.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/salary_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/work_time_widget.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/worker_details_widget.dart';
import 'package:attendance_and_departure/features/report/presentation/provider/report_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../config/text_style.dart';

class ProfilePAge extends StatelessWidget {
  ProfilePAge({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // UserProfileProvider userProfileProvider = Provider.of(context);
    return Form(
      key: formKey,
      child: Scaffold(
        body: Container(
          width: 100.w,
          height: 100.h,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              SizedBox(height: 10.h),
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
                      ],
                    )
            ]),
          ),
        ),
      ),
    );
  } 
}
