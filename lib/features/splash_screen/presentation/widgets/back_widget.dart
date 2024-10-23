import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/models/next_page_model.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/provider/splash_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key, required this.nextPageModel});
final NextPageModel nextPageModel;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        nextPageModel.onTap();
      },
      child: Container(
        height: 10.h,
        width: 12.5.w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.baseColor),
        child: Center(
            child:SvgWidget(svg: Images.awrroBackIcon)),
      ),
    );
  }
}