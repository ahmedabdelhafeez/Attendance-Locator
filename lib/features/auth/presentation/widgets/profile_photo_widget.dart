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

// class profileImage extends StatelessWidget {
//   const profileImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AuthProvider authProvider = Provider.of<AuthProvider>(context);
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         Stack(
//           clipBehavior: Clip.none,
//           children: <Widget>[
//             Positioned(
//                 child: Container(
//                     clipBehavior: Clip.antiAlias,
//                     width: 25.w,
//                     height: 15.h,
//                     decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle, border: Border.all(color:Colors.black)
//                     ),
//                     child:
//                         authProvider.logoImage != null
//                                                 ? Image.file(File(authProvider.logoImage!.path),
//                                                   fit: BoxFit.cover,)
//                                                 : (authProvider.userEntity?.image != null)
//                         ?
//                         CachedNetworkImage(
//                             imageUrl: authProvider.userEntity!.image,
//                             fit: BoxFit.cover)
//                         :
//                         CircleAvatar(
//                           backgroundColor: Colors.white,
//                           child: Image.asset(Images.profileImage,fit: BoxFit.cover,)))
//                           ),
//             Positioned(
//               top: 8.5.h,
//               child: InkWell(
//                 onTap: () async {
//                   FocusScope.of(context).unfocus();
//                   XFile? image = await chooseImage();
//                   if (image != null) {
//                     authProvider.updatelogoImage(image);
//                   }
//                 },
//                 child: Container(
//                   height: 7.h,
//                   width: 10.w,
//                   decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//                   child: SvgWidget(
//                     svg: Images.cameraIcon,
//                     width: 6.w,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//         Text(LanguageProvider.translate('titles', 'choose_your_prof_photo'),style: TextStyleClass.normalStyle(),)
//       ],
//     );
//   }
// }
