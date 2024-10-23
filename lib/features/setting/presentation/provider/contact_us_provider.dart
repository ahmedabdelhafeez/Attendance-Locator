import 'package:attendance_and_departure/core/helper_function/loading.dart';
import 'package:attendance_and_departure/features/setting/presentation/page/contact_us_page.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/text_field_model.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentation/provider/auth_provider.dart';
import '../../domain/use_cases/settings_use_cases.dart';

class ContactUsProvider with ChangeNotifier {
  List<TextFieldModel> inputs = [
    TextFieldModel(controller: TextEditingController(), key: "name", hint: "abdallh", label: "", ),
    TextFieldModel(controller: TextEditingController(), key: "email", hint: "example@exaple.com", label: "", ),
    TextFieldModel(controller: TextEditingController(), key: "subject", hint: "", label: "", ),
    TextFieldModel(controller: TextEditingController(), key: "message", hint: "", label: "", maxLines: 5,),
  ];

  void contactUs() async {
    AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
    Either<DioException, bool> response;
    Map<String, dynamic> data = {};
    loading();
   // data['user_id'] = authProvider.userEntity!.id;
    for (var i in inputs) {
      data[i.key!] = i.controller.text;
    }

    response = await SettingsUseCases(sl()).contactUs(data);
    navPop();
    response.fold((l) {
      showToast(l.message!);
    }, (r) {
      successDialog(then: () {
        navPop();
      });
    });
  }

  void clear() {
    for (var i in inputs) {
      i.controller.clear();
    }
  }

  void goToContactUsPage() {
    clear();
   // navP(ContactUsPage());
  }
}
