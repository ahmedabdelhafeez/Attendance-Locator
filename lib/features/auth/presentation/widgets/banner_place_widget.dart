// import 'dart:io';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:attendance_and_departure/config/app_color.dart';
// import 'package:attendance_and_departure/config/text_style.dart';
// import 'package:attendance_and_departure/core/constants/images.dart';
// import 'package:attendance_and_departure/core/helper_function/image.dart';
// import 'package:attendance_and_departure/core/widget/svg_widget.dart';
// import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
// import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// class BannerImageWidget extends StatelessWidget {
//   const BannerImageWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AuthProvider authProvider = Provider.of<AuthProvider>(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         InkWell(
//           onTap: () async {
//             FocusScope.of(context).unfocus();
//             XFile? image = await chooseImage();
//             if (image != null) {
//               authProvider.updatebannerImage(image);
//             }
//           },
//           child: Material(
//             elevation: 1.w,
//             color: Colors.white,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
//             child: Container(
//               width: 100.w,
//               height: 20.h,
//               clipBehavior: Clip.antiAlias,
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(2.w),
//                   border: Border.all(color: Colors.black)
//                   ),
//               child:
//                    authProvider.bannerImage != null
//                       ? Image.file(
//                           File(authProvider.bannerImage!.path),
//                           fit: BoxFit.cover,
//                         )
//                       : (authProvider.userEntity?.banner!= null)
//                           ? CachedNetworkImage(width: 5.w, height: 2.h, imageUrl: authProvider.userEntity!.banner, fit: BoxFit.fill):
//                           SvgWidget(svg:Images.chooseImageIcon,color: AppColor.baseColor,)
      
//             ),
//           ),
//         ),
//         SizedBox(height: 1.h,),
//          Text(LanguageProvider.translate('titles', 'add_a_banner'),style: TextStyleClass.normalStyle(),)
//       ],
//     );
//   }
// }
