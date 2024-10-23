import 'package:flutter/cupertino.dart';

class TextFieldModel {
  String? image, key, label, hint, titleText,lableText;
  TextInputType? textInputType;
  TextEditingController controller;
  bool next, obscureText, readOnly;
  String? Function(String?)? validator;
  Widget? suffix, prefix, title;
  void Function()? onTap,onSuffixTap;
  double? width,height;
  double? borderRadius;
  double? elevation;
  EdgeInsets? contentPadding;
  int? maxLines;
  TextStyle? labelStyle;
  Color? fillColor;
  TextStyle? style;
  Color? titleWidgetColor;
  bool? isPassword;
  Color? borderColor;
TextAlign? textAlign;
  Gradient? gradientColor;
  TextFieldModel(
      {this.image,
      this.key,
      this.onSuffixTap,
      this.isPassword,
      this.gradientColor,
      this.borderColor,
      this.textAlign,
      this.titleWidgetColor,
      this.fillColor,
      this.elevation,
      this.labelStyle,
      this.borderRadius,
      this.style,
      this.lableText,
      this.maxLines,
      this.label,
      this.hint = "",
      this.textInputType,
      this.readOnly = false,
      required this.controller,
      this.next = true,
      this.validator,
      this.onTap,
      this.suffix,
      this.prefix,
      this.title,
      this.titleText,
      this.width,
      this.height,
      this.contentPadding,
      this.obscureText = false});
}
