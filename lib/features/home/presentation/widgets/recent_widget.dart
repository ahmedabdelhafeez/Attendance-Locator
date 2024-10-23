import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyRecentWidget extends StatelessWidget {
  const MyRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Text('5:30 pm',style:TextStyleClass.normalBoldStyle(color: Colors.black),),
            Spacer(),
            Column(children: <Widget>[
               Text('تسجيل الانصراف',style:TextStyleClass.normalBoldStyle(color: Colors.black),),
               SizedBox(height: 0.5.h),
               Text('5 khassk 2024',style:TextStyleClass.normalBoldStyle(color: Color.fromARGB(255, 206, 209, 219)),),
            ],),
            SizedBox(width: 2.w,),
            CircleAvatar(
                    radius: 5.w,
                    backgroundColor:  Color(0xfff6f7f9),
                    child: Image.asset(
                     Images.checkIn,
                      width: 5.w,
                    ),
                  )
          ],);
  }
}