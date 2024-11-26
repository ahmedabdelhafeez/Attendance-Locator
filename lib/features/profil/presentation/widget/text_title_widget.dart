import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/widget/shimmer_text_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TextTitleWidget extends StatelessWidget {
  const TextTitleWidget({super.key, required this.text, this.textStyle, this.color});
  final String text;
  final TextStyle? textStyle;
  final List<Color> ?color;
  @override
  Widget build(BuildContext context) {
    return ShimmerTextWidget(
        gradient: LinearGradient(colors: color??[Colors.black, Colors.orange]),
        child: Text(
          textAlign: TextAlign.left,
          LanguageProvider.translate("settings", text), style: textStyle ?? TextStyleClass.normalBoldStyle()),
        shimmerDirection: ShimmerDirection.ttb,
        enabled: false);
  }
}
