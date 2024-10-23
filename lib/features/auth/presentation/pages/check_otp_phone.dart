import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/widget/button_widget.dart';
import 'package:attendance_and_departure/core/widget/list_text_field.dart';
import 'package:attendance_and_departure/features/auth/presentation/widgets/check_email_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/images.dart';
import '../provider/otp-proivder.dart';

class OTPPhoneNumberPage extends StatelessWidget {
  const OTPPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formstate = GlobalKey();
    var model = Provider.of<OtpProvider>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: AppColor.baseColor, borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.w), bottomLeft: Radius.circular(10.w))),
        ),
        // leading: InkWell(
        //   onTap: (){
        //     navPop();
        //   },
        //   child: SvgWidget(svg: Images.awrroBackPage)),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.w), bottomLeft: Radius.circular(10.w))),
        title: Text(
          LanguageProvider.translate("otp", "Restore_password"),
          style: TextStyleClass.headStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: formstate,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 100.h,
              width: 100.w,
              child: Padding(
                padding: appPadding,
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            image:  DecorationImage(image: AssetImage(Images.changePassImage1), fit: BoxFit.cover))),
                    SizedBox(height: 2.h),
                    const CheckEmailWidget(),
                    SizedBox(height: 5.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      // Row(
                      //   children: [
                      //     SvgWidget(
                      //       svg: model.inputs!.image!,
                      //       color: Colors.black,
                      //     ),
                      //     SizedBox(width: 2.w),
                      //     Text(
                      //       LanguageProvider.translate(
                      //           'inputs', model.inputs!.label!),
                      //       style: TextStyleClass.normalStyle(),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(height: 1.h),
                      ListTextFieldWidget(inputs: model.inputs),
                      // IntlPhoneField(
                      //   enabled: true,
                      //   showDropdownIcon: true,
                      //   onSubmitted: (value) {
                      //     FocusScope.of(context).nextFocus();
                      //   },
                      //   invalidNumberMessage: LanguageProvider.translate(
                      //       "inputs", "invalid_phone"),
                      //   // dropdownIconPosition: IconPosition.trailing,
                      //   decoration: InputDecoration(
                      //     isDense: true,
                      //     hintText: LanguageProvider.translate(
                      //       'hints',
                      //       model.inputs.firstWhere((e)=>e.hint).toString(),
                      //     ),
                      //     fillColor:Colors.grey,
                      //     filled: true,
                      //     hintStyle:
                      //         TextStyleClass.normalStyle(color: Colors.grey),
                      //     border: TextFieldWidget.decoration.border,
                      //     disabledBorder: TextFieldWidget.decoration
                      //         .disabledBorder, //TextFieldWidget.border(borderRadius: borderRadius, color: borderColor),
                      //     focusedBorder: TextFieldWidget.decoration
                      //         .focusedBorder, //TextFieldWidget.border(
                      //     enabledBorder:
                      //         TextFieldWidget.decoration.enabledBorder,
                      //     errorBorder: TextFieldWidget.decoration
                      //         .errorBorder, //TextFieldWidget.border(color: Colors.red, borderRadius: borderRadius),
                      //     focusedErrorBorder: TextFieldWidget.decoration
                      //         .focusedErrorBorder, //TextFieldWidget.border(color: Colors.red, borderRadius: borderRadius),
                      //     hoverColor: Colors.grey,
                      //     contentPadding: EdgeInsets.symmetric(
                      //         horizontal: 3.w, vertical: 2.h),
                      //   ),
                      //   initialCountryCode: 'SA',
                      //   showCountryFlag: true,

                      //   onChanged: (phone) {
                      //     model.inputs.controller.text =
                      //         phone.number;
                      //     print(model.inputs.controller.text);
                      //   },
                      // ),
                    ]),
                    SizedBox(height: 7.h),
                    ButtonWidget(
                       
                        height: 7.h,
                            borderRadius: BorderRadius.circular(5.w),
                        width: 80.w,
                        onTap: () {
                          Provider.of<OtpProvider>(Constants.globalContext(), listen: false).goToCodePage();

                          // if (formKey.currentState!.validate()) {
                          //   auth.loginButton();
                          // }
                        },
                        text: 'next')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
