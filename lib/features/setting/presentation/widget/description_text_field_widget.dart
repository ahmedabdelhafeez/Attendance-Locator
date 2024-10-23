import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widget/text_field.dart';

class DescriptionTextFieldWidget extends StatelessWidget {
  const DescriptionTextFieldWidget({super.key, required this.controller, this.maxLines, required this.title});
  final TextEditingController controller;
  final String title;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 4.w),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: TextFieldWidget(
                      maxLines: maxLines ?? 1,
                      borderRadius: 2.w,
                      contentPadding: EdgeInsets.symmetric(vertical: 2.h),
                      borderColor: Colors.black12,
                      color: Colors.white,
                      controller: controller,
                      validator: (val) {
                        return null;
                      },
                    )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    color: Colors.white,
                    child: Text(
                      LanguageProvider.translate("inputs", title),
                      style: TextStyleClass.normalStyle(),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
