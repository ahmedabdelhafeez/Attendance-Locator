import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_color.dart';
import '../../config/text_style.dart';


class RateWidget extends StatelessWidget {
  const RateWidget({super.key, this.rate = 0});
  final num rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColor.defaultColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.3.h),
      child: Center(child: Text(rate.toString(),style: TextStyleClass.normalStyle(color: Colors.black),)),
    );
  }
}
