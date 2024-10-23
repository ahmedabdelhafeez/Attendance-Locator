import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/check_group.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/check_widegt.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/header_widegt.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/recet_widegt.dart';
import 'package:attendance_and_departure/features/setting/presentation/page/account_settings_page.dart';
import 'package:attendance_and_departure/features/setting/presentation/provider/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileProvider userProfileProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Color(0xfff6f7f9),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: <Widget>[
            SizedBox(height: 4.h),
            HeaderWidegt(
              onTap: () {
                userProfileProvider.getData();
                navP(AccountSettingsPage());
              },
            ),
            CheckWidegt(),
            SizedBox(height: 26.h),
            Expanded(child: RecentWidegt())
          ],
        ),
      ),
    );
  }
}
