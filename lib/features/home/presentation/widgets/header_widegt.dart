import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:attendance_and_departure/features/setting/presentation/page/account_settings_page.dart';
import 'package:attendance_and_departure/features/setting/presentation/provider/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HeaderWidegt extends StatelessWidget {
   HeaderWidegt({super.key,  this.onTap});
 final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    UserProfileProvider userProfileProvider=Provider.of<UserProfileProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Container(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  Provider.of<AuthProvider>(Constants.globalContext(),listen: false).userName??"مرحبا بك في عملك",
                  style: TextStyleClass.headBoldStyle(color: Colors.black),
                ),
                Spacer(),
                InkWell(
                  onTap: onTap,
                  child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(color:  Color(0xfff6f7f9), shape: BoxShape.circle),
                      child: Image.asset(
                        Images.personn,
                        width: 7.w,
                      )),
                )
              ],
            ),
            Text(
              Provider.of<AuthProvider>(Constants.globalContext(), listen: false).dayTime,
              style: TextStyleClass.semiBoldStyle(color: const Color.fromARGB(255, 134, 133, 133)),
            ),
          ],
        ),
      ),
    );
  }
}
