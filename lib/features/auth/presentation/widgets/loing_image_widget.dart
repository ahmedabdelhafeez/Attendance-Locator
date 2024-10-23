import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class loginImageWidget extends StatelessWidget {
  const loginImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 100.w,
          height: 35.h,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage( Images.loginImage), 
          fit: BoxFit.cover)),
        );
  }
}
