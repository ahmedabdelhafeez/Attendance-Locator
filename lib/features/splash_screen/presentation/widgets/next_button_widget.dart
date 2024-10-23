import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/models/next_page_model.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/provider/splash_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({super.key, required this.nextPageModel, required this.width});
final NextPageModel nextPageModel;
final double? width;
  @override
  Widget build(BuildContext context) {
    SplashProvider splashProvider = Provider.of<SplashProvider>(context);
    return InkWell(
      onTap: () {
        nextPageModel.onTap();
      },
      child: Container(
        width: width,
        height: 5.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.w), bottomRight: Radius.circular(10.w), topLeft: Radius.circular(4.w), bottomLeft: Radius.circular(4.w)),
           color: AppColor.baseColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgWidget(svg: Images.next),
            Text(
              LanguageProvider.translate('buttons', nextPageModel.title??'next'),
              style: TextStyleClass.headStyle(color: Colors.white),
            ),
            SizedBox.shrink()
          ],
        ),

      ),
    );
  }
}
