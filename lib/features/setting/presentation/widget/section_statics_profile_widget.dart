import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/widget/shimmer_text_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:attendance_and_departure/features/setting/presentation/provider/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class SectionStaticsProfileWidget extends StatelessWidget {
  const SectionStaticsProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileProvider userProfileProvider = Provider.of<UserProfileProvider>(context);
    return Row(
      children: <Widget>[
        ...List.generate(userProfileProvider.staticList.length, (index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 3.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(userProfileProvider.staticList[index]["count"], style: TextStyleClass.normalStyle(color: AppColor.baseColor)),
                Text(LanguageProvider.translate("settings", userProfileProvider.staticList[index]["title"]), style: TextStyleClass.normalStyle(color: Colors.black)),
              ],
            ),
          );
        })
      ],
    );
  }
}
