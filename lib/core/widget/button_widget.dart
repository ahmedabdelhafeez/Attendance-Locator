import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_color.dart';
import '../../config/text_style.dart';


class ButtonWidget extends StatelessWidget {
  final double? width, height,elevation;
  final void Function() onTap;
  final Color? color, borderColor;
  final String? text;
    final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final Widget? widget;
  final bool widgetAfterText, takeSmallestWidth, isGredient;
  const ButtonWidget(
      {this.widget,
      this.width,
      this.height,
      required this.onTap,
      this.borderRadius,
       this.text,
      this.textStyle,
      this.borderColor,
      this.color,
      this.widgetAfterText = true,
      super.key,
      this.takeSmallestWidth = false,
      this.elevation,
      this.isGredient = false, this.padding});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: takeSmallestWidth ? null : (width ?? 90.w),
        height: height ?? 5.5.h,
        decoration: BoxDecoration(
          borderRadius:borderRadius ?? BorderRadius.circular(2.w),
          color: isGredient == true ? null : color ?? AppColor.baseColor,
          gradient: isGredient == true ? AppColor.gradient : null,
          border: borderColor == null || color == null
              ? null
              : Border.all(color: borderColor!),
        ),
        child: Padding(
          padding:padding ?? EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!widgetAfterText) widget ?? const SizedBox(),
              Text(
                LanguageProvider.translate("buttons", text??''),
                style: textStyle ??
                    TextStyleClass.textButtonStyle(color: Colors.white),
              ),
              if (widgetAfterText) widget ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class BorderButtonWidget extends StatelessWidget {
  final double? width, height, borderRadius;
  final void Function() onTap;
  final Color? color;
  final String text;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Widget? widget;
  final bool widgetAfterText, takeSmallestWidth;
  const BorderButtonWidget(
      {this.widget,
      this.width,
      this.height,
      required this.onTap,
      this.borderRadius,
      required this.text,
      this.textStyle,
      this.color,
      this.widgetAfterText = true,
      super.key,
      this.takeSmallestWidth = false, this.padding});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: takeSmallestWidth ? null : (width ?? 90.w),
        height: height ?? 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          color: Colors.white,
          border: Border.all(color: color ?? AppColor.defaultColor),
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!widgetAfterText) widget ?? const SizedBox(),
              if (!widgetAfterText && widget != null)
                SizedBox(
                  width: 3.w,
                ),
              Text(
                LanguageProvider.translate("buttons", text),
                style: textStyle ??
                    TextStyleClass.textButtonStyle(
                        color: color ?? Colors.white),
              ),
              if (widgetAfterText && widget != null)
                SizedBox(
                  width: 3.w,
                ),
              if (widgetAfterText) widget ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
