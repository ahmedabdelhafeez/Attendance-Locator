import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/button_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.w),
        ),
        content: Stack(
          clipBehavior: Clip.none,
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LanguageProvider.translate('settings', 'shar_app'),
              style: TextStyleClass.semiStyle(color: Colors.black),
            ),
            SizedBox(height: 2.h),
            // Message
            Text(
              LanguageProvider.translate('titles', 'With_your_friends_and_get_free_ads'),
              style: TextStyleClass.normalStyle(color: Color(0xff2C2B34)),
            ),
            SizedBox(height: 2.h),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonWidget(
                  onTap: () {},
                  text: 'shar',
                  width: 30.w,
                  height: 5.h,
                ),
                SizedBox(width: 3.w,),
                ButtonWidget(
                  onTap: () {},
                  text: 'cancel',
                  width: 30.w,
                  color: Colors.grey,
                  height: 5.h
                )
              ],
            )
          ],
        ),
        Positioned(
          top: -5.h,
         right: 58.w,
          child: Image.asset(Images.dialogImage))
        ],)
      );
    },
  );
}
