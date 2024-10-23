import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 100.w,height: 0.1.h,
            color: Colors.grey,
            );
  }
}