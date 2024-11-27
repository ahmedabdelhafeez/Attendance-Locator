import 'package:attendance_and_departure/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InfoWrapWidget extends StatelessWidget {
  const InfoWrapWidget(
      {super.key, required this.bordercolor, required this.title, required this.subtitle, required this.titleColor, required this.subtitleColor});
  final Color bordercolor;
  final Color titleColor;
  final Color subtitleColor;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
      child: Container(
        width: 45.w,
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.w), border: Border(right: BorderSide(color: bordercolor, width: 2.w))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              textAlign: TextAlign.start,
              title,
              style: TextStyleClass.normalStyle(color: titleColor),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              textAlign: TextAlign.start,
              subtitle,
              style: TextStyleClass.semiBoldStyle(color: subtitleColor),
            )
          ],
        ),
      ),
    );
  }
}
