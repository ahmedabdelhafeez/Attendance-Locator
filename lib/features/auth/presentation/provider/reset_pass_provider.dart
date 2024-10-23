import 'package:attendance_and_departure/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/models/text_field_model.dart';
import 'package:attendance_and_departure/features/auth/presentation/pages/reset_pass_page.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:sizer/sizer.dart';

class ResetPassProvider extends ChangeNotifier {
  List<TextFieldModel> inputs = [];

  bool checkPass() {
    return inputs.firstWhere((element) => element.key == 'password').controller.text ==
        inputs.firstWhere((element) => element.key == 'confirm_password').controller.text;
  }

  // Future resetButton() async {
  //   Map<String, dynamic> data = {};
  //
  //   for (var i in inputs) {
  //     data[i.key!] = i.controller.text;
  //   }
  //   AuthProvider authProvider =
  //       Provider.of(Constants.globalContext(), listen: false);
  //   OtpProvider otpProvider =
  //       Provider.of(Constants.globalContext(), listen: false);
  //   data['id'] = authProvider.userEntity?.id ?? otpProvider.userEntity!.id;
  //   loading();
  //   Either<DioException, bool> value =
  //       await UserUseCases(sl()).updatePassword(data);
  //
  //   value.fold((l) {
  //     showToast(l.message!);
  //   }, (r) {
  //     successDialog(then: () {
  //       navPU();
  //     });
  //   });
  // }

  void goToResetPassPage() {
    inputs = [
      TextFieldModel(
        key: "password",
        controller: TextEditingController(),
        fillColor: Colors.white24,
        titleWidgetColor: Colors.black,
        borderRadius: 4.w,
        label: "new_pass",
        labelStyle: TextStyleClass.normalStyle(color: Colors.black),
        borderColor: Colors.transparent,
        // image: Images.passIcon,
        hint: "************",
        obscureText: true,
      ),
      TextFieldModel(
          key: "password",
          controller: TextEditingController(),
          label: "confirm_pass",
          borderRadius: 4.w,
          labelStyle: TextStyleClass.normalStyle(color: Colors.black),
          fillColor: Colors.white24,
          titleWidgetColor: Colors.black,
          borderColor: Colors.transparent,
          // image: Images.passIcon,
          hint: "************",
          obscureText: true,
          validator: (val) {
            if (val!.isEmpty) {
              return LanguageProvider.translate('validation', 'field');
            }
            if (!checkPass()) {
              return LanguageProvider.translate('validation', 'password');
            }
            return null;
          },
          next: false),
    ];
    navP(ResetPassPage());
  }
}
