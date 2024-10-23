import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/widget/button_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';

class LawPage extends StatelessWidget {
  const LawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
        child: ButtonWidget(onTap:(){
        navPop();
        },
        text: 'i_accept_tirems_and_conditions',
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 2.h),
              Text(
                LanguageProvider.translate('titles', 'using_conditions'),
                style: TextStyleClass.bigStyle(color: Colors.black),
              ),
              Text(
                LanguageProvider.translate('titles', 'I_swear_I_will_pay_for_the_entire_application_and_sell_an_advertisement_outside_the_platform'),
                style: TextStyleClass.normalStyle(color: Colors.grey),
              ),
              Image.asset(Images.lawImage)
            ],
          ),
        ),
      ),
    );
  }
}
