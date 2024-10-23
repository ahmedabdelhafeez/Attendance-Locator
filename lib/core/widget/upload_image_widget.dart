// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:attendance_and_departure/core/constants/images.dart';
// import 'package:attendance_and_departure/core/helper_function/image.dart';
// import 'package:attendance_and_departure/core/widget/svg_widget.dart';
// import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import '../../config/text_style.dart';

// class UploadImageWidget extends StatelessWidget {
//   const UploadImageWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//    AuthProvider authProvider = Provider.of<AuthProvider>(context);
//     return InkWell(
//       onTap: () async {
//         if (authProvider.logoImage != null) {
//           showDialog(
//               context: context,
//               builder: (ctx) {
//                 return Container(
//                   height: 40.w,
//                   width: 40.w,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                           image: authProvider.showLogoImage(),
//                           fit: BoxFit.fill)),
//                 );
//               });
//         }
//       },
//       child: Container(
//         width: 55.w,
//         height: 25.h,
//         decoration: BoxDecoration(
//          color: Colors.grey,
//          border: Border.all(color:Colors.grey,width: 2),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
//         child: Column(
//           children: [
//             SizedBox(
//               width: 17.h,
//               height: 17.5.h,
//               child: Stack(
//                 children: [
//                   Container(
//                     width: 17.h,
//                     height: 17.5.h,
//                     decoration: const BoxDecoration(shape: BoxShape.circle),
//                     child:
//                     authProvider.logoImage != null
//                         ? Image.file(File(authProvider.logoImage!.path),
//                             fit: BoxFit.cover,)
//                         : (authProvider.userEntity?.logo != null)
//                             ? CachedNetworkImage(
                                
//                                 imageUrl: authProvider.userEntity!.logo,
//                                 fit: BoxFit.cover)
//                             :
//                     SvgWidget(
//                                 svg: Images.camera,
//                                 fit: BoxFit.cover,
//                               ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: InkWell(
//                         onTap: () async {
//                           FocusScope.of(context).unfocus();
//                           XFile? image = await chooseImage();
//                           if (image != null) {
//                            authProvider.updatelogoImage(image);
//                           }
//                         },
//                         child: SvgWidget(svg: Images.cameraIcon)
//                         ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 1.h),
//             Text(
//               LanguageProvider.translate('register', 'image'),
//               style: TextStyleClass.normalStyle(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
