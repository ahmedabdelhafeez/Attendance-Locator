import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/features/profil/presentation/widget/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemDateailWidget extends StatelessWidget {
  const ItemDateailWidget({super.key, required this.title, this.text, this.textStyle, this.corlor});
  final String title;
  final String? text;
  final TextStyle? textStyle;
  final List<Color>? corlor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        //border: Border(bottom: BorderSide(color: Colors.white))
        ),
      child: Row(
        children: [
          Text(title, style: TextStyleClass.normalBoldStyle(color: Colors.white)),
          // Spacer(),
          Expanded(
            child: TextTitleWidget(
              text: text??"",
              textStyle: textStyle,
              color: corlor,
            ),
          ),
        ],
      ),
    );
  }
}
