import 'package:flutter/material.dart';

import '../../config/text_style.dart';

class ContainerWithLabel extends StatelessWidget {
  final double? height, width;
  final String title;
  final Widget? widget;
  const ContainerWithLabel({
    super.key,
    this.height,
    this.width,
    this.widget, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelStyle: TextStyleClass.bigStyle(
            color: const Color(0xff474849)),
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Container( child: widget),
    );
  }
}
