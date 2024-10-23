import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'choose_between.dart';

class WrapButtons extends StatelessWidget {
  final void Function(int index) onTap;
  final List<String> buttonNames;
  final int? selectedIndex;
  const WrapButtons(
      {super.key,
      required this.onTap,
      required this.buttonNames,
      this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(1.w),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: buttonNames.length,
        itemBuilder: (context, index) {
          return ChooseBetween(
            width: 11.h,
            onTap: () {
               onTap(index);
            },
            text: buttonNames[index],
            isSelected: selectedIndex == index,
          );
        },
      ),
    );
  }
}
