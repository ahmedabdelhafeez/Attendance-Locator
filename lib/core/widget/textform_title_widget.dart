import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/text_style.dart';

class TextformTitleWidget extends StatelessWidget {
  const TextformTitleWidget({super.key, required this.text, required this.widget});
final String text;
final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Text(
              text,
              style: TextStyleClass.semiStyle(color: const Color(0xffA1A1A1)),
            ),
            SizedBox(
              height: 2.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[widget],
              ),
            )
          ],
        );
  }
}