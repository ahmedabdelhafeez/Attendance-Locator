// import 'package:attendance_and_departure/features/home/presentation/provider/khaled_provider.dart';
// import 'package:attendance_and_departure/features/home/presentation/widgets/check_widegt.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// class CheckGroup extends StatelessWidget {
//   const CheckGroup({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 3.w),
//       child: Wrap(
//         spacing: 2.w,
//         runSpacing: 2.w,
//         children: [
//           ...List.generate(Provider.of<KhaledProvider>(context).checkList.length,(index){
//             return CheckWidegt(model: Provider.of<KhaledProvider>(context).checkList[index],);
//           })
//         ],
//       ),
//     );
//   }
// }