import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
import 'package:attendance_and_departure/features/auth/presentation/widgets/hello_title_widget.dart';
import 'package:attendance_and_departure/features/auth/presentation/widgets/loing_image_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/widget/button_widget.dart';
import 'package:attendance_and_departure/core/widget/list_text_field.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

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
                    //    padding: appPadding,
                    child: SingleChildScrollView(
                        child: Column(children: [
                      loginImageWidget(),
                      HelloTitleWidget(),
                      SizedBox(height: 1.h),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 4.w), child: ListTextFieldWidget(inputs: auth.loginInputs)),
                      SizedBox(height: 1.h),
                      // Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 5.w),
                      //     child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      //       InkWell(
                      //           onTap: () {
                      //             Provider.of<OtpProvider>(context, listen: false).goToCheckEmailPage();
                      //           },
                      //           child: Text(LanguageProvider.translate('login', 'forget_password'), style: TextStyleClass.semiStyle(color: AppColor.baseColor)))
                      //     ])),
                      SizedBox(height: 4.h),
                      ButtonWidget(
                          borderRadius: BorderRadius.circular(5.w),
                          width: 80.w,
                          color: AppColor.baseColor,
                          height: 6.h,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              auth.loginButton();
                            }
                            print(Provider.of<AttendanceProvider>(context, listen: false).attendanceEntity);
                          },
                          text: 'login',
                          textStyle: TextStyleClass.normalStyle(color: Colors.white)),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LanguageProvider.translate('login', 'not_have'),
                            style: TextStyleClass.normalStyle(color: Color(0xff6C6C6C)),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();

                              auth.goToRegisterPage();
                            },
                            child: Text(
                              LanguageProvider.translate('login', 'register'),
                              style: TextStyleClass.normalStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ]))))));
  }
}
