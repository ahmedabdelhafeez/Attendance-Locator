// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import 'package:attendance_and_departure/config/text_style.dart';
// import 'package:attendance_and_departure/core/constants/images.dart';
// import 'package:attendance_and_departure/core/widget/svg_widget.dart';
// import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
// import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';

// class RegistrationProgress extends StatelessWidget {
//   const RegistrationProgress({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AuthProvider auth = Provider.of<AuthProvider>(context);
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     width: 20.w,
//                     height: 10.h,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: auth.getStepColor(0)),
//                       shape: BoxShape.circle,
//                     ),
//                     child: SvgWidget(svg: Images.firstRegisterIcon, color: auth.getStepColor(0)),
//                   ),
//                   Text(LanguageProvider.translate('titles', 'enter_your_info'), style: TextStyleClass.normalStyle())
//                 ],
//               ),
//               Expanded(
//                 child: Divider(thickness: 2, color: auth.getStepColor(1)),
//               ),
//               Column(
//                 children: [
//                   Container(
//                       width: 20.w,
//                       height: 10.h,
//                       decoration: BoxDecoration(border: Border.all(color: auth.getStepColor(1)), shape: BoxShape.circle),
//                       child: SvgWidget(svg: Images.secondRigsterIcon, color: auth.getStepColor(1))),
//                   Text(LanguageProvider.translate('titles', 'complete_info'), style: TextStyleClass.normalStyle())
//                 ],
//               ),
//               Expanded(child: Divider(thickness: 2, color: auth.getStepColor(2))),
//               Column(
//                 children: [
//                   Container(
//                     width: 20.w,
//                     height: 10.h,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: auth.getStepColor(2)),
//                       shape: BoxShape.circle,
//                     ),
//                     child: SvgWidget(svg: Images.thirdRegisterIcon, color: auth.getStepColor(2)),
//                   ),
//                   Text(LanguageProvider.translate('titles', 'welcome'), style: TextStyleClass.normalStyle())
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
