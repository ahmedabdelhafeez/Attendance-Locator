
// import 'package:attendance_and_departure/core/constants/constants.dart';
// import 'package:attendance_and_departure/core/constants/images.dart';
// import 'package:attendance_and_departure/features/setting/presentation/widget/description_text_field_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// import '../../../../core/widget/back_button_widget.dart';
// import '../../../../core/widget/button_widget.dart';
// import '../../../language/presentation/provider/language_provider.dart';
// import '../provider/contact_us_provider.dart';

// class ContactUsPage extends StatelessWidget {
//   ContactUsPage({super.key});
//   final form = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     ContactUsProvider contactUsProvider = Provider.of(context);
//     return GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Form(
//             key: form,
//             child: Scaffold(
//                 appBar: AppBar(title: Text(LanguageProvider.translate('settings', 'contact_us')), leading: const BackButtonWidget()),
//                 bottomNavigationBar: Container(
//                   color: Colors.white,
//                   padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
//                   child: ButtonWidget(
//                       onTap: () {
//                         FocusScope.of(context).unfocus();
//                         if (form.currentState!.validate()) {
//                           contactUsProvider.contactUs();
//                         }
//                       },
//                       text: 'send'),
//                 ),
//                 body: SizedBox(
//                     width: 100.w,
//                     height: 100.h,
//                     child: SingleChildScrollView(
//                         child: Stack(children: [
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 6.w),
//                         padding: EdgeInsets.only(top: 10.h, bottom: 2.h),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(3.w), bottomLeft: Radius.circular(15.w), bottomRight: Radius.circular(3.w), topRight: Radius.circular(3.w)),
//                             boxShadow: [myBoxShadow],
//                             color: Colors.white),
//                         child: Column(children: [
//                           SizedBox(height: 2.h),
//                           ...List.generate(
//                               contactUsProvider.inputs.length,
//                               (index) => DescriptionTextFieldWidget(
//                                   controller: contactUsProvider.inputs[index].controller,
//                                   maxLines: contactUsProvider.inputs[index].maxLines,
//                                   title: contactUsProvider.inputs[index].key!))
//                         ]),
//                       ),
//                       Container(height: 40.w, decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Images.contactUsImage))))
//                     ]))))));
//   }
// }
