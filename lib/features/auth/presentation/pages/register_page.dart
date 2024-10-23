import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/widget/button_widget.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:attendance_and_departure/features/auth/presentation/widgets/first_register_widget.dart';
import 'package:attendance_and_departure/features/auth/presentation/widgets/loing_image_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of(context);
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
            key: formKey,
            child: Scaffold(
                body: Container(
                    width: 100.w,
                    height: 100.h,
                   // padding: appPadding,
                    child: SingleChildScrollView(
                        child: Column(children: [
                      loginImageWidget(),
                      Text(LanguageProvider.translate("login", "register"), style: TextStyleClass.bigStyle(color: Colors.black)),
                      FirstRegisterWidget(),
                      SizedBox(height: 2.h),
                      ButtonWidget(
                                    onTap: () {
         if (formKey.currentState!.validate()) {
                              auth.registerButton();
                            }
                                    },
                                    text: 'login',
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: AppColor.baseColor,
                                  ),
                    ]))))));
  }
}
