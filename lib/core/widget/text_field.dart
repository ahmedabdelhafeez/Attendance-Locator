import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_color.dart';
import '../../config/text_style.dart';
import '../constants/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final bool autoFocus, next, otp, readOnly;
  final TextEditingController controller;
  final double? width, height, verticalPadding, borderRadius, elevation;
  final Widget? titleWidget, prefix, suffix;
  final void Function(String)? onChange;
  final void Function()? onTextTap, onEditingComplete, onSuffixTap;
  final int? maxLines, maxLength, minLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? counter, labelText, inputLableText, hintText, titleText;
  final Color? color, borderColor, cursorColor, focusedBorder, enabledBorder;
  final TextStyle? style, hintStyle;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;
  final TextStyle? labelStyle;
  final Color? fillColor;
  bool? obscureText, isPassword;

  TextFieldWidget({
    this.labelStyle,
    this.maxLines,
    this.labelText,
    this.cursorColor,
    required this.controller,
    this.height,
    this.width,
    this.style,
    this.focusedBorder,
    this.enabledBorder,
    this.color,
    this.borderColor,
    this.borderRadius,
    this.counter,
    this.autoFocus = false,
    this.keyboardType,
    this.maxLength,
    this.next = true,
    this.obscureText,
    this.textAlign,
    this.onChange,
    this.onEditingComplete,
    this.onSuffixTap,
    this.otp = false,
    this.prefix,
    this.readOnly = false,
    this.suffix,
    this.onTextTap,
    this.titleWidget,
    this.validator,
    this.verticalPadding,
    super.key,
    this.minLines,
    this.contentPadding,
    this.hintText,
    this.titleText,
    this.elevation,
    this.hintStyle,
    this.fillColor,
    this.inputLableText,
    this.isPassword,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 1.h,
      ),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleWidget ?? const SizedBox(),
            if (titleText != null && titleWidget == null)
              TitleTextFieldWidget(
                titleText: titleText!,
                style: style ?? TextStyleClass.semiStyle(),
              ),
            if (titleWidget != null || titleText != null)
              SizedBox(
                height: 0.5.h,
              ),
            Material(
              borderRadius: BorderRadius.circular(borderRadius ?? 2.w),
              elevation: elevation ?? 0,
              child: SizedBox(
                width: width ?? 100.w,
                height: height,
                child: TextFormField(
                  textAlign: textAlign ?? TextAlign.start,
                  obscureText: isPassword!=null?Provider.of<AuthProvider>(context, listen: false).obscureText:false,
                  onChanged: onChange,
                  controller: controller,
                  // cursorHeight: 25,
                  onTap: onTextTap ??
                      () {
                        TextEditingController c = controller;
                        if (c.selection == TextSelection.fromPosition(TextPosition(offset: c.text.length - 1))) {
                          c.selection = TextSelection.fromPosition(TextPosition(offset: c.text.length));
                        }
                      },
                  minLines: minLines,
                  cursorColor: Colors.black,
                  readOnly: readOnly,
                  autofocus: autoFocus,
                  maxLines: maxLines ?? 1,
                  maxLength: maxLength,

                  style: style ?? TextStyleClass.semiStyle(),
                  validator: validator ??
                      (value) {
                        if (value!.isEmpty) {
                          return LanguageProvider.translate(
                            'validation',
                            'field',
                          );
                        }
                        return null;
                      },
                  onEditingComplete: onEditingComplete ??
                      () {
                        FocusScope.of(context).unfocus();
                        if (next) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                  keyboardType: keyboardType,
                  decoration: inputDecoration(context, fillColor ?? Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(var context, Color fillColor) {
    return InputDecoration(
      counterText: counter,
      //isDense: true,
      counterStyle: TextStyleClass.normalStyle(),
      labelText: labelText == null
          ? null
          : LanguageProvider.translate(
              'inputs',
              labelText!,
            ),
      hintText: hintText == null
          ? null
          : LanguageProvider.translate(
              'hints',
              hintText!,
            ),
      hintStyle: hintStyle ?? TextStyleClass.normalStyle(color: Colors.grey),
      fillColor: fillColor ?? Colors.white,
      filled: true,
      labelStyle: labelStyle ?? TextStyleClass.normalStyle(color: const Color(0xff8F8C8C)),
      floatingLabelStyle: TextStyleClass.normalStyle(),
      border: focusedBorder != null ? null : border(borderRadius: borderRadius, color: borderColor, otp: otp),
      disabledBorder: border(borderRadius: borderRadius, color: borderColor, otp: otp),
      focusedBorder: border(borderRadius: borderRadius, color: focusedBorder ?? borderColor, borderWidth: focusedBorder == null ? 0 : 3, otp: otp),
      enabledBorder: border(borderRadius: borderRadius, color: enabledBorder ?? borderColor, otp: otp),
      errorBorder: border(color: Colors.red, borderRadius: borderRadius, otp: otp),
      focusedErrorBorder: border(color: Colors.red, borderRadius: borderRadius, otp: otp),
      hoverColor: Colors.grey,
      prefixIcon: prefix,
      contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 3.w, vertical: Constants.isTablet ? 1.4.h : 1.5.h),
      suffixIcon: suffix ??
          (isPassword == null
              ? null
              : IconButton(
                  onPressed: () {
                Provider.of<AuthProvider>(context,listen: false).toggelePassState();
                  },
                  icon: Icon(
                    !Provider.of<AuthProvider>(context, listen: false).obscureText ? Icons.visibility_off_outlined : Icons.visibility,
                    size: 20,
                    color:!Provider.of<AuthProvider>(context, listen: false).obscureText ? Colors.grey : const Color.fromARGB(255, 0, 0, 0),
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent)),
    );
  }

  static InputBorder border({Color? color, double? borderRadius, double? borderWidth, bool otp = false}) {
    if (otp) {
      return UnderlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
        borderSide: BorderSide(color: color ?? const Color(0xffE2E2E2), width: borderWidth ?? 1),
      );
    }
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 5),
      borderSide: BorderSide(color: color ?? const Color(0xffE2E2E2), width: borderWidth ?? 1),
    );
  }

  static InputDecoration get decoration {
    return InputDecoration(
        isDense: true,
        counterStyle: TextStyleClass.normalStyle(),
        counterText: '',
        fillColor: Colors.white,
        border: border(),
        disabledBorder: border(),
        focusedBorder: border(),
        enabledBorder: border(),
        errorBorder: border(color: Colors.red),
        focusedErrorBorder: border(),
        contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: Constants.isTablet ? 1.4.h : 1.7.h));
  }
}

class TitleTextFieldWidget extends StatelessWidget {
  const TitleTextFieldWidget({super.key, required this.titleText, required this.style});
  final String titleText;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text(
      LanguageProvider.translate('inputs', titleText),
      style: style,
    );
  }
}
