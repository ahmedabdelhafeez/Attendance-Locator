import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/button_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';

class CloseAppPage extends StatelessWidget {
  const CloseAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
        child: ButtonWidget(onTap: (){},
        text: 'conect_form_whats',
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 5.h),
            Text(LanguageProvider.translate("titles", "Your_account_has_been_closed"), style: TextStyleClass.bigStyle(color: Colors.black)),
            SizedBox(height: 1.h),
            Text(LanguageProvider.translate("titles", "your_not_paid_for_three_day"), style: TextStyleClass.normalStyle(color: Colors.grey)),
            SizedBox(height: 2.h),
            Image.asset(Images.blockAppImage)
          ],),
        ),
      ),
    );
  }
}