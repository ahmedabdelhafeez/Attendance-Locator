import 'package:flutter/material.dart';
import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:sizer/sizer.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: data['onTap'],
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 1.h),
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.w), color: Color.fromARGB(31, 214, 214, 214)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 243, 240, 240)),
                      child: SvgWidget(
                        svg: data['image'],
                        width: 5.w,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Text(LanguageProvider.translate("settings", data['title']),
                        style: TextStyleClass.normalBoldStyle(color: const Color(0xff615D5C))),
                    const Spacer(),
                    SvgWidget(svg: Images.awrroBackIcon,color: AppColor.baseColor,width: 2.4.w,),
                    SizedBox(width: 2.w,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
