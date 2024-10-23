import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/header_widegt.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:attendance_and_departure/features/setting/presentation/provider/user_profile_provider.dart';
import 'package:attendance_and_departure/features/setting/presentation/widget/settings_widget.dart';
import 'package:attendance_and_departure/features/setting/presentation/widget/statices_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_and_departure/features/setting/presentation/widget/user_package_widget.dart';
import '../../../../../../config/app_color.dart';
import '../../../../../../config/text_style.dart';
import '../../../../../../core/widget/svg_widget.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileProvider userProfileProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
          // leading: SizedBox.shrink(),
          centerTitle: true,
          flexibleSpace: Container(decoration: BoxDecoration(color: AppColor.baseColor)),
          title: Text(LanguageProvider.translate("settings", "settings"), style: TextStyleClass.headStyle(color: Colors.white))),
      body: Container(
        width: 100.w,
        height: 100.h,
        child: SingleChildScrollView(
          child: Column(children: [
            HeaderWidegt(),
            SizedBox(height: 1.h),
            ...List.generate(userProfileProvider.settings.length,
                (index) => Padding(padding: EdgeInsets.symmetric(horizontal: 7.w), child: SettingsWidget(data: userProfileProvider.settings[index]))),
            SizedBox(height: 2.h),
            InkWell(
              onTap: () {
                // Provider.of<AuthProvider>(context, listen: false).confirmLogoutAccount();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 8.w, height: 6.w, child: SvgWidget(svg: Images.logoutIcon, width: 5.w, height: 5.w, fit: BoxFit.cover)),
                  SizedBox(width: 3.w),
                  Text(LanguageProvider.translate("settings", "exit"), style: TextStyleClass.headStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(height: 10.h),
          ]),
        ),
      ),
    );
  }
}
