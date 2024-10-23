import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/reset_pass_provider.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../config/text_style.dart';
import '../../../../core/widget/button_widget.dart';
import '../../../../core/widget/list_text_field.dart';

class ResetPassPage extends StatelessWidget {
  ResetPassPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ResetPassProvider resetPassProvider = Provider.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: AppColor.baseColor, borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.w), bottomLeft: Radius.circular(10.w))),
          ),
          // leading: InkWell(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: SvgWidget(svg: Images.awrroBackPage)),
          centerTitle: true,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.w), bottomLeft: Radius.circular(10.w))),
          title: Text(
            LanguageProvider.translate("check_phone", "change"),
            style: TextStyleClass.headStyle(color: Colors.white),
          ),
        ),
        body: Form(
          key: formKey,
          child: Container(
            width: 100.w,
            height: 100.h,
            padding: appPadding,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 1.h),
                  // SvgWidget(
                  //     svg: Images.newPassIcon,  // محتاج ايكون
                  //     width: 35.w,
                  //     fit: BoxFit.fitWidth),
                  SizedBox(height: 3.h),
                   Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            image: DecorationImage(image: AssetImage(Images.changePassImage3), fit: BoxFit.cover))),
                  ListTextFieldWidget(
                    inputs: resetPassProvider.inputs,
                  ),
                  SizedBox(height: 3.h),
                  ButtonWidget(
                      height: 7.h,
                      width: 80.w,
          
                     borderRadius: BorderRadius.circular(5.w),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        // if (formKey.currentState!.validate()) {
                        //   resetPassProvider.resetButton();
                        // }
                      },
                      text: 'next'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
