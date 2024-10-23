import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';

class UserPackageWidget extends StatelessWidget {
  const UserPackageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.w),
      child: Material(
        elevation: 2.w,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.w)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SvgWidget(svg: Images.dimondIcon),
                  SizedBox(height: 1.h),
                  Text(
                    "الماسي",
                    style: TextStyleClass.normalStyle(color: AppColor.baseColor),
                  )
                ],
              ),
              SizedBox(width: 1.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    LanguageProvider.translate('titles', 'monthly_subscrip'),
                    style: TextStyleClass.normalStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    width: 50.w,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(2.w),
                      value: 0.5, // 50% progress
                      backgroundColor: Colors.grey[300],
                      color: Colors.green, 
                      minHeight: 0.7.h,
                      // Progress color
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgWidget(svg: Images.publishedTimeIcon,width: 5.w,),
                  SizedBox(
                    width: 1.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '14 يوم',
                        style: TextStyleClass.normalStyle(color: AppColor.baseColor),
                      ),
                      Text(
                        LanguageProvider.translate('titles', 'end_date'),
                        style: TextStyleClass.normalStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
