import 'package:flutter/material.dart';
import 'package:attendance_and_departure/config/app_color.dart';
import 'package:sizer/sizer.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key, required this.check, required this.onChange, this.padding, this.border, this.borderRadius});
  final bool check;
  final Color? border;
  final double? borderRadius;
  final EdgeInsets? padding;
  final void Function(bool val) onChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChange(!check);
      },
      child: Container(
        decoration: BoxDecoration(
          border: check ? null : Border.all(color: border ?? AppColor.baseColor, width: 1.2, strokeAlign: BorderSide.strokeAlignCenter),
          color: check ? AppColor.baseColor : Colors.white,
          borderRadius: BorderRadius.circular(borderRadius??2.w),
        ),
        padding: padding ?? EdgeInsets.all(0.5.w),
        child: const Icon(
          Icons.done,
          color: Colors.white,
          size: 13,
        ),
      ),
    );
  }
}
