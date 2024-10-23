import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';

class ConditionsPolicesWidget extends StatelessWidget {
  const ConditionsPolicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: LanguageProvider.translate('titles', 'by_continuing_you_agree_to_the'),
              style: TextStyleClass.normalStyle(color: Color(0xff7B7B7B))),
          TextSpan(
              text: LanguageProvider.translate('titles', 'terms_and_conditions'),
              style: TextStyleClass.normalStyle(
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [Color(0xffD785F1), Color(0xff4381F8)],
                    ).createShader(Rect.fromLTRB(295, 0, 50, 0)))),
          TextSpan(text: LanguageProvider.translate('titles', 'and'), style: TextStyleClass.normalStyle(color: Color(0xff7B7B7B))),
          TextSpan(
              text: LanguageProvider.translate('titles', 'privacy_policy'),
              style: TextStyleClass.normalStyle(
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [Color(0xffD785F1), Color(0xff4381F8)],
                    ).createShader(Rect.fromLTRB(120, 0, 40, 0)))),
          TextSpan(text: LanguageProvider.translate('titles', 'of_the_application'), style: TextStyleClass.normalStyle(color: Color(0xff7B7B7B))),
        ]));
  }
}
