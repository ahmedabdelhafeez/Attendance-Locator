import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/models/next_page_model.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/provider/splash_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({super.key});

  @override
  Widget build(BuildContext context) {
        SplashProvider splashProvider = Provider.of<SplashProvider>(context);
    return InkWell(
        splashColor: Colors.transparent,
      onTap: (){
        splashProvider.skipIntro();
      },
      child: Container(
        height: 10.h,
        width: 17.w,
        decoration: BoxDecoration(shape: BoxShape.circle,color: AppColor.baseColor),
        child: Center(
            child: Text(
          LanguageProvider.translate('buttons', 'skip'),
          style: TextStyleClass.semiStyle(color: Colors.white),
        )),
      ),
    );
  }
}
