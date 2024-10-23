import 'package:attendance_and_departure/core/widget/shimmer_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../models/text_field_model.dart';
import 'text_field.dart';

class ListTextFieldWidget extends StatelessWidget {
  const ListTextFieldWidget({
    super.key,
    required this.inputs,
  });
  final List<TextFieldModel> inputs;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: Column(
            children: List.generate(inputs.length, (index) {
          return
              // list.contains(inputs[index].label)
              //   ?
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFieldWidget(
              obscureText: inputs[index].obscureText,
              onSuffixTap: inputs[index].onSuffixTap,
              height: inputs[index].height,
              borderRadius: inputs[index].borderRadius,
              fillColor: inputs[index].fillColor??Colors.white,
              borderColor: inputs[index].borderColor??Colors.grey,
              elevation: inputs[index].elevation,
              controller: inputs[index].controller,
              textAlign: inputs[index].textAlign,
              keyboardType: inputs[index].textInputType,
              next: inputs[index].next,
              onTextTap: inputs[index].onTap,
              maxLines: inputs[index].maxLines,
              validator: inputs[index].validator,
              labelText: inputs[index].lableText,
              hintStyle: TextStyleClass.normalStyle(color: Color(0xff9E9E9E)),
              suffix: inputs[index].key == 'phone'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child:Text(
                            "",
                            style: TextStyleClass.normalBoldStyle(color: AppColor.baseColor),
                          )
                        ),
                      ],
                    )
                  : inputs[index].suffix,
              hintText: inputs[index].hint,
              prefix: inputs[index].prefix,
              readOnly: inputs[index].readOnly,
              titleWidget: inputs[index].title ??
                  Row(
                    children: [
                      inputs[index].image != null
                          ? Row(
                              children: [
                                SvgWidget(svg: inputs[index].image!),
                                SizedBox(
                                  width: 2.w,
                                )
                              ],
                            )
                          : const SizedBox.shrink(),
                      inputs[index].label != null
                          ? Text(
                              LanguageProvider.translate(
                                'inputs',
                                inputs[index].label!,
                              ),
                              style: TextStyleClass.normalStyle(color: inputs[index].titleWidgetColor??Colors.grey),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
              style: inputs[index].style,
              titleText: inputs[index].titleText,
              width: inputs[index].width,
              contentPadding: inputs[index].contentPadding ?? EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              labelStyle: inputs[index].labelStyle, isPassword: inputs[index].isPassword,
            )
          ]);
        })));
  }
}
