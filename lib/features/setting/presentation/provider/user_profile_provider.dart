import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/core/dialog/snack_bar.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/reset_pass_provider.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:attendance_and_departure/features/setting/domain/entities/settings_entity.dart';
import 'package:attendance_and_departure/features/setting/domain/use_cases/settings_use_cases.dart';
import 'package:attendance_and_departure/features/setting/presentation/page/web_view_page.dart';
import 'package:attendance_and_departure/features/setting/presentation/provider/contact_us_provider.dart';
import 'package:attendance_and_departure/features/setting/presentation/widget/show_shar_dialog_widget.dart';
import 'package:attendance_and_departure/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/constants/images.dart';
import '../../../../../../core/helper_function/navigation.dart';

class UserProfileProvider extends ChangeNotifier {
  List<Map> settings = [];
  List<Map> accountSettings = [];
  List<Map> staticList = [];
  void getData() {
        AuthProvider auth =  Provider.of<AuthProvider>(Constants.globalContext(), listen: false);

    settings = [
        {
        "image": Images.starIcon,
        "title": "Monthly_packages",
        "onTap": () {
       //  Provider.of<PackageProvider>(Constants.globalContext(), listen: false).goToPackagePage();
        }
      },
         {
       "image": Images.decuomentAccountIcon,
        "title": "documentation_acc",
        "onTap": () {
        //  Provider.of<DocumentationProvider>(Constants.globalContext(), listen: false).goToDocuMentatioPage();
        },
      },
      {
        "image": Images.lockIconAccount,
        "title": "change_pass",
        "onTap": () {
        Provider.of<ResetPassProvider>(Constants.globalContext(), listen: false).goToResetPassPage();
        }
      },
      
     {
        "image": Images.conectionUsIcon,
        "title": "contact_us",
        "onTap": () {
    //    Provider.of<ConectUsProvider>(Constants.globalContext(), listen: false).goToContectUsPage();
        }
      },
      {
        "image": Images.whoUsIcon,
        "title": "about_us",
        "onTap": () {
          navP(WebViewPage(title: 'about_us', link: settingsEntity?.aboutLink ?? ""));
        },
      },
      {
        "image": Images.termesIcon,
        "title": "terms_and_conditions",
        "onTap": () {
          navP(WebViewPage(title: 'terms', link: settingsEntity?.termsLink ?? ""));
        },
      },
      {
        "image": Images.privcyIcon,
        "title": "privacy",
        "onTap": () {
          navP(WebViewPage(title: 'privacy', link: settingsEntity?.privacyLink ?? ""));
        },
      },
      {
        "image": Images.sharAppIcon,
        "title": "share_app",
        "onTap": () async {
          showCustomDialog(Constants.globalContext());
          //  String url = 'https://apps.apple.com/app/id${Constants.appId}';
          // if(Platform.isAndroid){
          //    url = 'https://play.google.com/store/apps/details?id=${Constants.packageName}';
          // }
          // final box = Constants.globalContext().findRenderObject() as RenderBox?;
          // await Share.share("${LanguageProvider.translate('global', 'share_description')}\n$url",
          //   sharePositionOrigin: Constants.isTablet?
          //   (box!.localToGlobal(Offset.zero) & box.size):null,);
        },
      },
      {
        "image": Images.deleteAccountIcon,
        "title": "Delete_My_Account",
        "onTap": () {
        //  Provider.of<WalletProvider>(Constants.globalContext(), listen: false).goToWalletPage();
        },
        "color": AppColor.defaultColor
      },
      {
        "image": Images.changeLangIcon,
        "title": "Change_the_language",
        "onTap": () {
          Provider.of<LanguageProvider>(Constants.globalContext(), listen: false).showLangDialog();
        },
      },
    ];
     staticList = [
      // {"title":"follower","count":auth.userEntity?.isFollow ?? "200"},
      // {"title":"follow","count":auth.userEntity?.productsCount ?? "150"},
      // {"title":"ad","count":auth.userEntity?.isFollow ?? "20"},
    ];
  }

  String? qr;
  void clear() {
    notifyListeners();
  }

  void rebuild() {
    notifyListeners();
  }

  SettingsEntity? settingsEntity;
  double cancelFee = 0;

  Future getSettings() async {
    Either<DioException, SettingsEntity> response = await SettingsUseCases(sl()).getSettings();
    response.fold((l) {
      showToast(l.message!);
    }, (r) {
      settingsEntity = r;
      notifyListeners();
    });
  }
  void gotoProfilePage(int id) {
    // AuthenticationProvider auth = Provider.of(Constants.globalContext(),listen: false);

    // if(auth.isGuest){
    //   showGuestDialog();
    // }else{
    //   refresh(id);
    AuthProvider auth =  Provider.of<AuthProvider>(Constants.globalContext(), listen: false);
    // staticList = [
    //   {"title":"followers","count":auth.userEntity?.followCount ?? 0},
    //   {"title":"product","count":auth.userEntity?.productsCount ?? 0},
    //   {"title":"orders","count":auth.userEntity?.ordersCount ?? 0},
    // ];
  //  navP(const AccountSettingsPage());
    // }
  }
}
