
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_color.dart';
import '../../config/text_style.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  const EmptyWidget({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 50.h,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Stack(children: [
               // SvgWidget(svg: Images.emptyIcon, width: 40.w),
                // Positioned(
                //     bottom: 0,
                //     right: 0,
                //     left: 0,
                //     child: SvgWidget(
                //         svg: Images.emptyCartIcon,
                //         color: AppColor.secColor,
                //         width: 40.w))
              ]),
              // Image.asset(Images.emptyIcon,color: AppColor.defaultColor,width: 23.w,fit: BoxFit.fitWidth,),
              SizedBox(height: 4.h),
              Text(LanguageProvider.translate("checkout", title),
                  style: TextStyleClass.semiHeadBoldStyle(
                      color: AppColor.defaultColor),
                  textAlign: TextAlign.center)
            ])));
  }
}
