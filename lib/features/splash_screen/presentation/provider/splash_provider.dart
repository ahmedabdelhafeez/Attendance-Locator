import 'package:attendance_and_departure/core/helper_function/api.dart';
import 'package:attendance_and_departure/core/helper_function/prefs.dart';
import 'package:attendance_and_departure/core/models/next_page_model.dart';
import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
import 'package:attendance_and_departure/features/report/presentation/provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/helper_function/helper_function.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashProvider extends ChangeNotifier {
  List<Map> intro = [
    {
      "title": "The_best_application",
      "body":
          "Provide you with detailed manufacturing that you can simply order and installEase and competitive price compared to the quality of our product.",
      "image": Images.introImage1
    },
    {
      "title": "The_best_application",
      "body":
          "Provide you with detailed manufacturing that you can simply order and installEase and competitive price compared to the quality of our product.",
      "image": Images.introImage2
    },
  ];
  String getLastIndex() {
    if (index == intro.length - 1) {
      return "start";
    } else {
      return "continue";
    }
  }

  NextPageModel nextPageModel = NextPageModel(
      title: 'next',
      onTap: () {
        Provider.of<SplashProvider>(Constants.globalContext(), listen: false).incrementSelect();
      });
  NextPageModel backPageModel = NextPageModel(
      title: '',
      onTap: () {
        Provider.of<SplashProvider>(Constants.globalContext(), listen: false).decrementSelect();
      });
  int index = 0;
  void startApp() async {
    await delay(800);
    Provider.of<AuthProvider>(Constants.globalContext(), listen: false).getUniqueId();
    String? token = CashMemmory.getData(key: 'userToken');
    print(token);
    print(' userI ---------------------- > ' + CashMemmory.getData(key: 'UserId').toString());
    if (token == null) {
      Provider.of<AuthProvider>(Constants.globalContext(), listen: false).goToRegisterPage();
    } else {
      ApiHandle.getInstance.updateHeader(token);
      Provider.of<AttendanceProvider>(Constants.globalContext(), listen: false).getEmployeeHome(CashMemmory.getData(key: 'UserId'));
      Provider.of<ReportProvider>(Constants.globalContext(), listen: false).getEmployeeReport(CashMemmory.getData(key: 'UserId'));
      Provider.of<AttendanceProvider>(Constants.globalContext(), listen: false).goToLoactionHome();
    }
  }

  void clear() {
    // introEntity = null;
    notifyListeners();
  }

  incrementSelect() {
    if (index == intro.length - 1) {
      return Provider.of<AuthProvider>(Constants.globalContext(), listen: false).goToLoginPage();
    }
    index++;
    notifyListeners();
  }

  void decrementSelect() {
    index--;

    notifyListeners();
  }

  void changeNotifyListeners() {
    notifyListeners();
  }

  void skipIntro() {
    Provider.of<AuthProvider>(Constants.globalContext(), listen: false).goToLoginPage();
  }

  String title(index) {
    if (index == 0) {
      return "next";
    } else {
      return "next";
    }
  }
}
