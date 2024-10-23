import 'package:attendance_and_departure/core/helper_function/api.dart';
import 'package:attendance_and_departure/core/helper_function/prefs.dart';
import 'package:attendance_and_departure/core/models/next_page_model.dart';
import 'package:attendance_and_departure/features/attendance/presentation/pages/loacation_page.dart';
import 'package:attendance_and_departure/features/auth/presentation/pages/login_page.dart';
import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/helper_function/helper_function.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/pages/intro_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/helper_function/navigation.dart';

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
    // await Future.wait([
    //   Provider.of<CategoriesProvider>(Constants.globalContext(), listen: false)
    //       .getCategories(),
    //   Provider.of<SettingsProvider>(Constants.globalContext(), listen: false)
    //       .getSettings(),f
    // ]);
    // Provider.of<AuthProvider>(Constants.globalContext(), listen: false).requestLocationPermission();
    await delay(800);

    // var settingProvider =
    //     Provider.of<SettingsProvider>(Constants.globalContext(), listen: false);
    // SettingsEntity? settings = settingProvider.settingsEntity;
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // if (Platform.isAndroid) {
    //   if (int.parse(packageInfo.buildNumber) < settings!.version) {
    //     await updateDialog(settings.mustUpdate);
    //     if (settings.mustUpdate) {
    //       return;
    //     }
    //   }
    // } else if (Platform.isIOS) {
    //   if (int.parse(packageInfo.buildNumber) < settings!.iosVersion) {
    //     await updateDialog(settings.mustUpdateIos);
    //     if (settings.mustUpdateIos) {
    //       return;
    //     }
    //   }
    // }
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool intro = prefs.getBool('intro') ?? false;
// print(intro);
//  prefs.setBool('intro', true) ?? false;
    String? token = CashMemmory.getData(key: 'userToken');
    print(token);
    if (token == null) {
      Provider.of<AuthProvider>(Constants.globalContext(), listen: false).goToLoginPage();
    } else {
      ApiHandle.getInstance.updateHeader(token);
      Provider.of<AttendanceProvider>(Constants.globalContext(), listen: false).getTodayAttendacneEmployee(token);
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
