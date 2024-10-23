// import 'package:attendance_and_departure/config/app_color.dart';
// import 'package:attendance_and_departure/config/text_style.dart';
// import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// class TimeWidget extends StatelessWidget {
//   const TimeWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AttendanceProvider locationProvider = Provider.of<AttendanceProvider>(context);
//     return locationProvider.mylocation!=null
//         ? Column(
//             children: <Widget>[
//               locationProvider.toggeleState!
//                   ? Text(
//                       'وقت الحضور',
//                       style: TextStyleClass.normalBoldStyle(color: AppColor.baseColor),
//                     )
//                   : Text(
//                       'وقت الانصراف',
//                       style: TextStyleClass.normalBoldStyle(color: Colors.red),
//                     ),
//               SizedBox(height: 1.h),
//              // Text(locationProvider.startTime ?? "", style: TextStyleClass.smallBoldStyle()),
//               SizedBox(height: 1.h),
//               Text(
//                 textAlign: TextAlign.center,
//                 locationProvider.mylocation?? "",
//                 style: TextStyleClass.semiBoldStyle(color: AppColor.baseColor),
//               ),
//             ],
//           )
//         : SizedBox.shrink();
//   }
// }
