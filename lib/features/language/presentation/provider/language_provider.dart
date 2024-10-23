import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/core/helper_function/prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widget/button_widget.dart';
import '../../domain/use_cases/translate_text.dart';

class LanguageProvider extends ChangeNotifier {
  late Locale
      language; // use this var when control state of language widget then use it for change language
  Locale _appLocale = const Locale('ar');
  static const List<Locale> languages = [
    Locale('ar', ''),
    Locale("en", ""),
  ];
  Locale get appLocal => _appLocale;
  static bool languageIsAr =
     CashMemmory.sharedPreferences.getString("language_code") == "ar";

  static bool getLanguage() {
    return  CashMemmory.sharedPreferences.getString("language_code") == "ar";
  }

  Future<String?> checkLanguageCode() async {
    var prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString('language_code');
    return language;
  }

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString('language_code');
    if (language == null) {
      _appLocale = const Locale('ar');
    } else {
      _appLocale = Locale(language);
    }
    notifyListeners();
  }

  // Future changeLanguage() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   _appLocale = language;
  //   await prefs.setString('language_code', language.languageCode);
  //   notifyListeners();
  //   AuthProvider auth = Provider.of(Constants.globalContext(),listen: false);
  //   ApiHandel.getInstance.updateHeader(auth.userEntity!.token??"123",language: language.languageCode);
  //   afterChangeLanguage();
  // }

  void setLanguage(Locale locale, {bool rebuild = true}) {
    language = locale;
    if (rebuild) notifyListeners();
  }

  void rebuild() {
    notifyListeners();
  }

  // String getTranslate(String key,value){
  //   Map _localizedStrings = ApiHandel.getInstance.languages[_appLocale.languageCode];
  //   if(_localizedStrings.containsKey(key)&&_localizedStrings[key].containsKey(value)){
  //     return _localizedStrings[key][value];
  //   }
  //   return value;
  // }
  static String translate(String key, String value) {
    // LanguageProvider languageProvider = Provider.of
    //   (Constants.globalContext(),listen: false);
    // return languageProvider.getTranslate(key,value);
    return Translate.translate(key, value);
  }

  Future afterChangeLanguage() async {
    //navPARU(const SplashPage());
  }
  void showLangDialog() {
    var language =
        Provider.of<LanguageProvider>(Constants.globalContext(), listen: false);
    String oldLang = language.appLocal.languageCode;
    showModalBottomSheet(
      context: Constants.globalContext(),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              width: 100.w,
              constraints: BoxConstraints(
                maxHeight: 35.h,
                minHeight: 35.h,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: StatefulBuilder(
                    builder: (ctx, setState2) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 3.h,
                          ),
                          RadioListTile<String>(
                              value: 'ar',
                              groupValue: oldLang,
                              onChanged: (val) {
                                setState2(() {
                                  oldLang = val!;
                                });
                              },
                              title: Text(
                                'العربية',
                                style: TextStyle(fontSize: 12.sp, height: 1),
                              ),
                              contentPadding: EdgeInsets.zero,
                              activeColor: AppColor.defaultColor),
                          RadioListTile<String>(
                              value: 'en',
                              groupValue: oldLang,
                              onChanged: (val) {
                                setState2(() {
                                  oldLang = val!;
                                });
                              },
                              title: Text(
                                'English',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              contentPadding: EdgeInsets.zero,
                              activeColor: AppColor.defaultColor),
                          SizedBox(
                            height: 1.h,
                          ),
                          ButtonWidget(
                              onTap: () {
                                language.setLanguage(
                                  Locale(oldLang),
                                  rebuild: true,
                                );
                                // language.changeLanguage();
                              },
                              text: "save"),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
      isScrollControlled: true,
    );
  }
}
