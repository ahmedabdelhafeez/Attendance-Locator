import 'dart:async';
import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/features/auth/presentation/pages/reset_pass_page.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/models/text_field_model.dart';
import 'package:attendance_and_departure/features/auth/presentation/pages/check_otp.dart';
import 'package:attendance_and_departure/features/auth/presentation/pages/check_otp_phone.dart';
import 'package:sizer/sizer.dart';

class OtpProvider extends ChangeNotifier {
  bool wrong = false;
  final List<TextEditingController> otp = List.generate(5, (index) => TextEditingController());
  // UserEntity? userEntity;
  String? hashedCode;
  int counter = 60;
  bool clicked = false;
  Timer? timer;
  List<TextFieldModel> inputs = [];

  void clear() {
    // userEntity = null;
    for (var i in otp) {
      i.clear();
    }
    inputs = [
      TextFieldModel(
          key: "phone",
          controller: TextEditingController(),
          label: "phone",
          //  image: Images.mobilIcon,
          hint: "phone",
          textInputType: TextInputType.phone,
          next: false)
    ];
  }

  String phone() {
    return inputs.firstWhere((element) => element.key == 'phone').controller.text;
  }

  // void reSend() {
  //   if (userEntity == null) {
  //     Provider.of<AuthProvider>(Constants.globalContext(), listen: false)
  //         .canRegister(isResend: true);
  //   } else {
  //     checkPhoneButton(isResend: true);
  //   }
  // }

  void sendCodeFromRegister({required String code, bool isResend = false}) {
    hashedCode = code;
    startTimer();
    if (!isResend) navP(CheckOtp());
  }
  //
  // void checkCode() async {
  //   Map<String, dynamic> data = {};
  //   String code = '';
  //   for (var element in otp) {
  //     code += element.text;
  //   }
  //   data['code'] = code;
  //   data['hashed_code'] = hashedCode;
  //   loading();
  //   Either<DioException, bool> confirmCode =
  //       await UserUseCases(sl()).checkCode(data);
  //   confirmCode.fold((l) {
  //     navPop();
  //     showToast(l.message!);
  //   }, (r) async {
  //     timer?.cancel();
  //     if (userEntity == null) {
  //       Provider.of<AuthProvider>(Constants.globalContext(), listen: false)
  //           .registerButton();
  //     } else {
  //       navPop();
  //       navPop();
  //       Provider.of<ResetPassProvider>(Constants.globalContext(), listen: false)
  //           .goToResetPassPage();
  //     }
  //   });
  // }
  //
  // Future checkPhoneButton({bool isResend = false}) async {
  //   Map<String, dynamic> data = {};

  //   for (var element in inputs) {
  //     data[element.key!] = element.controller.text;
  //   }
  //   if (data['phone'].toString().startsWith('0')) {
  //     data['phone'].toString().substring(1);
  //   }
  //   loading();
  //   Either<DioException, Map> value = await UserUseCases(sl()).checkPhone(data);
  //   navPop();

  //   value.fold((l) {
  //     showToast(l.message!);
  //   }, (r) async {
  //     userEntity = r['user'];
  //     hashedCode = r['code'];
  //     startTimer();
  //     if (!isResend) navP(CheckOtp());
  //   });
  // }

  void goToCheckEmailPage() {
    clear();
    inputs = [
      TextFieldModel(
          key: "phone",
          controller: TextEditingController(),
          fillColor: Colors.white24,
          gradientColor: AppColor.gradient,
          hint: "phone",
          borderRadius: 4.w,
          borderColor: Colors.transparent,
          textInputType: TextInputType.phone,
          next: false)
    ];
    navP(const OTPPhoneNumberPage(), then: (val) {});
  }

  void goToCodePage() {
    navP(CheckOtp(), then: (val) {});
  }

  void goToCodePageCheckOtp() {
    navP(CheckOtp());
  }

  void goToResetPassPage() {
    navP(ResetPassPage());
  }

  void startTimer() {
    counter = 60;
    clicked = false;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (e) {
      if (timer?.isActive ?? false) {
        try {
          counter--;
          notifyListeners();
        } catch (e) {
          print(e);
        }
      }
      if (counter == 0) {
        e.cancel();
      }
    });
    notifyListeners();
  }
}
