// import 'package:attendance_and_departure/config/app_color.dart';
// import 'package:attendance_and_departure/config/text_style.dart';
// import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
// import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
// import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
// import 'package:attendance_and_departure/features/attendance/presentation/widgets/rippleButton.dart';
// import 'package:attendance_and_departure/features/attendance/presentation/widgets/time_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// class LoacationPage extends StatelessWidget {
//   const LoacationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: SizedBox.shrink(),
//           centerTitle: true,
//           flexibleSpace: Container(decoration: BoxDecoration(color: AppColor.baseColor)),
//           title: Text(LanguageProvider.translate("titles", "الحضور والانصراف"), style: TextStyleClass.headStyle(color: Colors.white))),
//       body: Container(
//           height: 100.h,
//           width: 100.w,
//           child: SingleChildScrollView(
//               child: Column(
//             children: <Widget>[
//               SizedBox(height: 10.h),
//               Text(
//                 'مرحباً بك في عملك',
//                 style: TextStyleClass.normalBoldStyle(color: Colors.black),
//               ),
//               SizedBox(height: 1.h),
//               Text(
//                 textAlign: TextAlign.center,
//                 Provider.of<AuthProvider>(context, listen: false).userName ?? 'ايها  العامل',
//                 style: TextStyleClass.headBoldStyle(color: Colors.black),
//               ),
//               SizedBox(height: 7.h),
//               SizedBox(height: 2.h),
//               RippleButtonScreen(),
//               SizedBox(height: 2.h),
//               TimeWidget(),
//               SizedBox(height: 2.h)
//             ],
//           ))),
//     );
//   }
// }
