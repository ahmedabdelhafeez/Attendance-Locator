import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/features/auth/presentation/pages/reset_pass_page.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/otp-proivder.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/reset_pass_provider.dart';
import 'package:attendance_and_departure/features/auth/presentation/widgets/otp_widget.dart';
import 'package:attendance_and_departure/features/auth/presentation/widgets/resend_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/widget/button_widget.dart';
import '../../../../config/app_color.dart';

class CheckOtp extends StatelessWidget {
  final GlobalKey<FormState> formstate = GlobalKey();
  CheckOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
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
              LanguageProvider.translate("otp", "check_with_two_steps"),
              style: TextStyleClass.headStyle(color: Colors.white),
            ),
          ),
          body: Form(
            key: formstate,
            child: SingleChildScrollView(
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h),
                    // Center(
                    //   child: Text(
                    //       LanguageProvider.translate("otp", "check_otp"),
                    //       style: TextStyleClass.semiBigStyle(
                    //           color: AppColor.defaultColor)),
                    // ),
                    SizedBox(height: 5.h),
                    // Center(
                    //   child: Padding(
                    //     padding:  EdgeInsets.only(right: 10.w),
                    //     child: SizedBox(
                    //         height: 60.w,
                    //         width: 95.w,
                    //         child: Image.asset(Images.adminphotomassage, fit: BoxFit.fill)),
                    //   ),
                    // ),
                    Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            image: DecorationImage(image: AssetImage(Images.changePassImage2), fit: BoxFit.cover))),
                    SizedBox(height: 2.h),
                    const OTPWidget(),
                    const ResendWidget(),
                    SizedBox(height: 3.h),
                    Center(
                      child: ButtonWidget(
                          height: 7.h,
                          borderRadius: BorderRadius.circular(5.w),
                          width: 80.w,

                          // width: 100.w,
                          onTap: () {
                            if (formstate.currentState!.validate()) {
                              // Provider.of<OtpProvider>(context, listen: false)
                              //     .checkCode();
                              Provider.of<ResetPassProvider>(context, listen: false).goToResetPassPage();
                            }
                          },
                          text: "next",
                          textStyle: TextStyleClass.semiBoldStyle(color: Colors.white)),
                    ),
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

// class OTPWidget extends StatelessWidget {
//   const OTPWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextFieldWidget(
//         style: TextStyleClass.semiHeadStyle(),
//         borderColor: Colors.grey,
//         height: 17.w,
//         width: 17.w,
//         onChange: (value) {
//           if (value.length == 1) FocusScope.of(context).nextFocus();
//         },
//         // inputFormatters: [
//         //   LengthLimitingTextInputFormatter(1),
//         //   FilteringTextInputFormatter.digitsOnly
//         // ],
//         keyboardType: TextInputType.number,
//         controller: TextEditingController(),
//       ),
//     );
//   }
// }
