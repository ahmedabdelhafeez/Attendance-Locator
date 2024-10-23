// import 'package:attendance_and_departure/config/app_color.dart';
// import 'package:attendance_and_departure/config/text_style.dart';
// import 'package:attendance_and_departure/core/dialog/confirm_dialog.dart';
// import 'package:attendance_and_departure/core/helper_function/navigation.dart';
// import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sizer/sizer.dart';

// class RippleButtonScreen extends StatefulWidget {
//   @override
//   _RippleButtonScreenState createState() => _RippleButtonScreenState();
// }

// class _RippleButtonScreenState extends State<RippleButtonScreen> with SingleTickerProviderStateMixin {
//   AnimationController? _controller;
//   Animation<double>? _rippleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );

//     _rippleAnimation = Tween<double>(begin: 0, end: 45.w).animate(
//       CurvedAnimation(parent: _controller!, curve: Curves.easeOut),
//     )..addListener(() {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   void _startRipple() {
//     _controller?.forward(from: 0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     AttendanceProvider locationProvider = Provider.of<AttendanceProvider>(context);
//     return Center(
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           AnimatedBuilder(
//             animation: _controller!,
//             builder: (context, child) {
//               return Container(
//                 width: _rippleAnimation?.value,
//                 height: _rippleAnimation?.value,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: locationProvider.toggeleState! ? const Color.fromARGB(255, 115, 22, 16) : const Color.fromARGB(255, 10, 131, 42),
//                 ),
//               );
//             },
//           ),
//           GestureDetector(
//             onTap: () {
//               _startRipple();
//               confirmDialog(
//                   locationProvider.toggeleState! ? 'هل انت متاكد من تسجيل الانصراف' : 'هل انت متاكد من تسجيل الحضور',
//                   'تاكيد',
//                   () {
//                       locationProvider.getCurrentLocation();
//                     navPop();
//                   },
//                   cancel: 'الغاء',
//                   cancelTap: () {
//                     navPop();
//                   });
            
//             },
//             child: Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 color: locationProvider.toggeleState! ? Colors.red : AppColor.baseColor,
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                   child: locationProvider.toggeleState!
//                       ? Text(
//                           'تسجيل الانصراف',
//                           style: TextStyleClass.normalBoldStyle(color: Colors.white),
//                         )
//                       : Text(
//                           'تسجيل الحضور',
//                           style: TextStyleClass.normalBoldStyle(color: Colors.white),
//                         )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
