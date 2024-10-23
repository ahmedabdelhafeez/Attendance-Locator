import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_color.dart';
import '../../config/text_style.dart';

class ChooseBetween extends StatelessWidget {
  final bool isSelected;
  final String text;
  final double? width, height;
  final VoidCallback onTap;

  const ChooseBetween({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.text,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          color: isSelected ? AppColor.defaultColor : const Color(0xffEAEAEA),
        ),
        padding: EdgeInsets.all(3.w),
        child: Text(
          LanguageProvider.translate("sub_categories", text),
          style: TextStyleClass.normalStyle(
              color: isSelected ? Colors.white : const Color(0xff555050)),
        ),
      ),
    );
  }
}
