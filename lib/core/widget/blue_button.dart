import 'package:flutter/material.dart';

import '../../config/text_style.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Icon? icon;
  const BlueButton({
    super.key,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon != null ? icon! : const SizedBox(),
        Text(
          text,
          style: TextStyleClass.normalStyle(color: Colors.white),
        ),
      ],
    );
  }
}
