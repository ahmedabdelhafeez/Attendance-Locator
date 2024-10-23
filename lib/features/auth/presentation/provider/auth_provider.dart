import 'dart:io';
import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/core/dialog/confirm_dialog.dart';
import 'package:attendance_and_departure/core/dialog/snack_bar.dart';
import 'package:attendance_and_departure/core/helper_function/api.dart';
import 'package:attendance_and_departure/core/helper_function/helper_function.dart';
import 'package:attendance_and_departure/core/helper_function/loading.dart';
import 'package:attendance_and_departure/core/models/next_page_model.dart';
import 'package:attendance_and_departure/features/auth/domain/entities/user_entity.dart';
import 'package:attendance_and_departure/features/auth/domain/usecases/user_usecases.dart';
import 'package:attendance_and_departure/features/auth/presentation/pages/law_page.dart';
import 'package:attendance_and_departure/features/auth/presentation/pages/register_page.dart';
import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/widgets/back_widget.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/widgets/next_button_widget.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/helper_function/prefs.dart';
import 'package:attendance_and_departure/core/models/text_field_model.dart';
import 'package:attendance_and_departure/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';

class AuthProvider extends ChangeNotifier {
   String dayTime = DateFormat('d MMMM y', 'ar').format(DateTime.now());
  UserEntity? userEntity;
  String ? userName;
  DateTime lastLogin = DateTime.now();
  bool fromAuthRegister = true;
  bool obscureText = true;
  void toggelePassState() {
    obscureText = !obscureText;
    notifyListeners();
  }

  NextPageModel nextPageModel = NextPageModel(
      title: 'next',
      onTap: () {
        Provider.of<AuthProvider>(Constants.globalContext(), listen: false).incrementSelect();
      });
  NextPageModel backPageModel = NextPageModel(onTap: () {
    Provider.of<AuthProvider>(Constants.globalContext(), listen: false).decrementSelect();
  });
  void changeNotifyListeners() {
    notifyListeners();
  }

  int index = 0;
  incrementSelect() {
    index++;
    print(index);
    notifyListeners();
  }

  void decrementSelect() {
    index--;
    print(index);
    notifyListeners();
  }

  void goToLawPage() {
    navP(LawPage());
  }

  Widget returnButtonNextPageWidget() {
    if (index == 0) {
      return NextButtonWidget(nextPageModel: nextPageModel, width: index == 0 ? 90.w : 70.w);
    }
    return Row(
      children: [NextButtonWidget(nextPageModel: nextPageModel, width: index == 0 ? 90.w : 70.w), Spacer(), BackWidget(nextPageModel: backPageModel)],
    );
  }
  // bool isUserHavelogoImage() {
  //   if (userEntity?.logo != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // bool isUserHavebannerImage() {
  //   if (userEntity?.banner != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // showLogoImage() {
  //   if (userEntity?.logo != null || logoImage != null) {
  //     if (logoImage != null) {
  //       return FileImage(File(logoImage!.path));
  //     } else {
  //       return CachedNetworkImageProvider(
  //         userEntity!.logo,
  //       );
  //     }
  //   }
  // }

  // showbannerImage() {
  //   if (userEntity?.logo != null || logoImage != null) {
  //     if (logoImage != null) {
  //       return FileImage(File(logoImage!.path));
  //     } else {
  //       return CachedNetworkImageProvider(
  //         userEntity!.logo,
  //       );
  //     }
  //   }
  // }

  XFile? logoImage;
  XFile? bannerImage;
  bool imageUpdated = false;
  final TextEditingController pointController = TextEditingController();
  final TextEditingController visaController = TextEditingController();

  List<String> payments = ['visa', 'applepay'];
  String payment = 'visa';
  bool transfer = false;
  final TextEditingController walletController = TextEditingController();

  // Future downloadImages() async {
  //   final tempDir = await getTemporaryDirectory();
  //   await Future.wait([
  //     http.get(Uri.parse(userEntity!.logo)),
  //   ]).then((value) async {
  //     final response = value[0];
  //     final bytes = response.bodyBytes;
  //     final tempPath =
  //         '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
  //     await File(tempPath).writeAsBytes(bytes);
  //     image = XFile(File(tempPath).path);
  //     notifyListeners();
  //   });
  // }

  static bool isLogin() {
    return CashMemmory.sharedPreferences.getBool('login') ?? false;
  }

  // List<Map> walletData = [];
  // void goToWalletPage() {
  //   transfer = true;
  //   payment = 'visa';
  //   // Provider.of<CheckOutProvider>(Constants.globalContext(), listen: false)
  //   //     .getPaymentMethods(transfer: transfer);
  //   walletData = [
  //     {
  //       "image": Images.arrowInIcon,
  //       "title": "add_balance_through_app",
  //       "onTap": () {
  //         // Provider.of<AuthProvider>(Constants.globalContext(),listen: false).goToAccountSettingsPage();
  //       },
  //       "color": AppColor.secColor
  //     },
  //     {
  //       "image": Images.arrowOut,
  //       "title": "purshase_through_app",
  //       "onTap": () {
  //         // Provider.of<AuthProvider>(Constants.globalContext(),listen: false).goToAccountSettingsPage();
  //       },
  //       "color": AppColor.fifthColor
  //     },
  //   ];
  //   getTransaction();
  //   getProfile();
  //   navP(const WalletPage());
  // }

  // List<TransactionEntity> transactions = [];
  // void getTransaction() async {
  //   Map<String, dynamic> data = {};
  //   // AccessTokenFireBase accessTokenGetter = AccessTokenFireBase();
  //   // String token = await accessTokenGetter.getAccessToken();
  //   data['token'] = await FirebaseMessaging.instance.getToken();
  //
  //   data['token'] = token;
  //   // Either<DioException, List<TransactionEntity>> login =
  //   //     await UserUseCases(sl()).getTransactions(data);
  //   login.fold((l) {
  //     showToast(l.message!);
  //   }, (r) async {
  //     transactions = r;
  //     notifyListeners();
  //   });
  // }

  // void getProfile() async {
  //   // Map<String, dynamic> data = {};
  //   // data['token'] = await FirebaseMessaging.instance.getToken();
  //   Either<DioException, UserEntity> login =
  //       await UserUseCases(sl()).getProfile();
  //   login.fold((l) {
  //     showToast(l.message!);
  //   }, (r) async {
  //     userEntity = r;
  //     notifyListeners();
  //   });
  // }

  bool getTransactionType(String type) {
    if (type == "add") {
      return true;
    } else {
      return false;
    }
  }

  void updateTransfer(bool bool) {
    transfer = bool;
    notifyListeners();
  }

  void goToHomePage() {
    //navP(MarketHomePage());
  }

  void goToCreateNewMArketPage() {
    //   navP(CreateNewattendance_and_departurePage());
  }

  void updatelogoImage(XFile image) {
    imageUpdated = true;
    logoImage = image;
    notifyListeners();
  }

  void updatebannerImage(XFile image) {
    imageUpdated = true;
    bannerImage = image;
    notifyListeners();
  }

  void changePayment(String element) {
    payment = element;
    notifyListeners();
  }

  bool paymentSelected(String element) {
    return payment == element;
  }

  // bool isGuest() {
  //   return userEntity == null;
  // }

  // String transformUrl(String url) {
  //   if (isGuest()) {
  //     return url.replaceFirst('user', 'guest');
  //   }
  //   return url;
  // }

  List<TextFieldModel> registerInputs = [];
  List<TextFieldModel> loginInputs = [
    TextFieldModel(
      borderColor: Colors.grey,
      borderRadius: 4.w,
      gradientColor: AppColor.defaultgredint,
      key: "userName",
      fillColor: Colors.white30,
      titleWidgetColor: Colors.black,
      image: Images.copyIcon,
      validator: (val) {
        if (val!.length != 14) {
          return "يجب أن لا يقل او يذيد الرقم القومي  عن 14 أحرف";
        }
        if (!RegExp(r'^\d+$').hasMatch(val)) {
          return "يجب أن يحتوي  الرقم القومي على أرقام فقط";
        }
      },
      labelStyle: TextStyleClass.semiStyle(color: Colors.black),
      controller: TextEditingController(),
      label: "الرقم القومي",
      textInputType: TextInputType.phone,
      hint: "مثال : 3000905218535483",
      next: true,
    ),
    TextFieldModel(
      borderColor: Colors.grey,
      key: "password",
      borderRadius: 4.w,
      fillColor: Colors.white30,
      titleWidgetColor: Colors.black,
      image: Images.lockPassIcon,
      isPassword: true,
      validator: (val) {
        if (val!.length < 8) {
          return "يجب أن لا تقل كلمة المرور عن 8 أحرف";
        }
        if (!RegExp(r'[a-z]').hasMatch(val)) {
          return "يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل";
        }
        if (!RegExp(r'[A-Z]').hasMatch(val)) {
          return "يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل";
        }
        if (!RegExp(r'\d').hasMatch(val)) {
          return "يجب أن تحتوي كلمة المرور على رقم واحد على الأقل";
        }
        if (!RegExp(r'[\W_]').hasMatch(val)) {
          return "يجب أن تحتوي كلمة المرور على علامة مميزة واحدة على الأقل (مثل @، #، !)";
        }
      },
      labelStyle: TextStyleClass.semiStyle(color: Colors.black),
      controller: TextEditingController(),
      label: "pass",
      hint: "************",
      next: true,
    )
  ];
  bool checkPass() {
    return registerInputs.firstWhere((element) => element.label == 'pass').controller.text ==
        registerInputs.firstWhere((element) => element.label == 'confirm_pass').controller.text;
  }

  void goToRegisterPage({fromAuthRegister = true}) {
    getUniqueId();
    this.fromAuthRegister = fromAuthRegister;
    imageUpdated = false;
    if (fromAuthRegister) {
      registerInputs = [
        TextFieldModel(
          borderColor: Colors.grey,
          borderRadius: 4.w,
          gradientColor: AppColor.defaultgredint,
          key: "nationalId",
          fillColor: Colors.white30,
          titleWidgetColor: Colors.black,
          image: Images.copyIcon,
          validator: (val) {
            if (val!.length != 14) {
              return "يجب أن لا يقل او يذيد الرقم القومي  عن 14 أحرف";
            }
            if (!RegExp(r'^\d+$').hasMatch(val)) {
              return "يجب أن يحتوي  الرقم القومي على أرقام فقط";
            }
          },
          labelStyle: TextStyleClass.semiStyle(color: Colors.black),
          controller: TextEditingController(),
          label: "الرقم القومي",
          textInputType: TextInputType.phone,
          hint: "مثال : 3000905218535483",
          next: true,
        ),
        TextFieldModel(
          borderColor: Colors.grey,
          key: "password",
          borderRadius: 4.w,
          fillColor: Colors.white30,
          titleWidgetColor: Colors.black,
          image: Images.lockPassIcon,
          isPassword: true,
          validator: (val) {
            if (val!.length < 8) {
              return "يجب أن لا تقل كلمة المرور عن 8 أحرف";
            }
            if (!RegExp(r'[a-z]').hasMatch(val)) {
              return "يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل";
            }
            if (!RegExp(r'[A-Z]').hasMatch(val)) {
              return "يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل";
            }
            if (!RegExp(r'\d').hasMatch(val)) {
              return "يجب أن تحتوي كلمة المرور على رقم واحد على الأقل";
            }
            if (!RegExp(r'[\W_]').hasMatch(val)) {
              return "يجب أن تحتوي كلمة المرور على علامة مميزة واحدة على الأقل (مثل @، #، !)";
            }
          },
          labelStyle: TextStyleClass.semiStyle(color: Colors.black),
          controller: TextEditingController(),
          label: "pass",
          hint: "************",
          next: true,
        ),
        TextFieldModel(
          borderColor: Colors.grey,
          key: "password",
          borderRadius: 4.w,
          fillColor: Colors.white30,
          titleWidgetColor: Colors.black,
          image: Images.lockPassIcon,
          labelStyle: TextStyleClass.semiStyle(color: Colors.black),
          controller: TextEditingController(),
          next: true,
          label: "confirm_pass",
          hint: "************",
          validator: (val) {
            if (val!.isEmpty) {
              return LanguageProvider.translate('validation', 'field');
            }
            if (!checkPass()) {
              return LanguageProvider.translate('validation', 'كلمة المرور غير متطابقة');
            }
            return null;
          },
        ),
      ];
    } else {
      // downloadImages();
      registerInputs = [
        TextFieldModel(
          controller: TextEditingController(text: /* userEntity?.name ??  */ ""),
          key: 'name',
          titleText: 'name',
          titleWidgetColor: Colors.black,
          borderRadius: 4.w,
        ),
        TextFieldModel(
          controller: TextEditingController(text: /* userEntity?.phone ?? */ ""),
          key: 'phone',
          titleText: 'phone',
          titleWidgetColor: Colors.black,
          borderRadius: 4.w,
        ),
        TextFieldModel(
            controller: TextEditingController(text: /* userEntity?.email ?? */ ""),
            key: 'email',
            titleText: 'email',
            textInputType: TextInputType.emailAddress,
            borderRadius: 4.w,
            next: true),
        TextFieldModel(
          key: "about_me",
          controller: TextEditingController(),
          label: "about_me",
          titleWidgetColor: Colors.black,
          borderRadius: 4.w,
          // image: Images.editIcon,
          textInputType: TextInputType.emailAddress,
          hint: "about_me",
          next: false,
        )
      ];
    }
    navP(RegisterPage());
  }

  // Timer? _refreshTimer;
  // Map<String, dynamic> decodedToken = {};

  // void startRefreshTimer(String? token) {
  //   const duration = Duration(minutes: 59);
  //   _refreshTimer = Timer.periodic(duration, (timer) {
  //     // Call the function to refresh the JWT refresh token here
  //     refreshToken(token: token);
  //   });
  // }

  // void stopRefreshTimer() {
  //   _refreshTimer?.cancel();
  // }

  // void refreshToken({String? token}) async {
  //   // decodedToken = JwtDecoder.decode(userEntity!.refreshToken!);
  //   try {
  //     // Send a request to your server to refresh the JWT refresh token
  //     // Example using Dio package:
  //     // var response = await dio.post('/refresh-token', data: {'refreshToken': refreshToken});
  //     // Handle response and update tokens
  //   } catch (e) {
  //     // Handle error, log out user, etc.
  //   }
  // }

  Future loginButton({bool fromSplash = false, bool fromJWT = false}) async {
    //token = await FirebaseMessaging.instance.getToken() ?? "123";
    Map<String, dynamic> data = {};
    // data['token'] = token;
    if (fromSplash) {
      loginInputs.firstWhere((element) => element.key == 'userName').controller =
          TextEditingController(text: CashMemmory.sharedPreferences.getString("userName"));
      loginInputs.firstWhere((element) => element.key == 'password').controller =
          TextEditingController(text: CashMemmory.sharedPreferences.getString("password"));
    }
    for (var element in loginInputs) {
      data[element.key!] = element.controller.text;
    }
    if (data['phone'].toString().startsWith('0')) {
      data['phone'].toString().substring(1);
    }
    // data['token'] = token;
    if (!fromSplash) loading();
    Either<DioException, UserEntity> login = await UserUseCases(sl()).login(data);
    login.fold((l) {
      if (!fromSplash) navPop();
      if (fromSplash) {
        navPARU(LoginPage());
      } else {
        confirmDialog(
          l.response!.data['message'],
          'الغاء',
          () {
            navPop();
          },
        );
        //  showToast(l.response!.data['message']);
      }
    }, (r) async {
   
      print("-------------------->" + r.toString());
      successLogin(userEntity: r, password: data['password'], fromJWT: fromJWT, nationalId: data['userName']);
      notifyListeners();
      //   AccessTokenFireBase accessTokenGetter = AccessTokenFireBase();
      // String token = await accessTokenGetter.getAccessToken();
      // print("-------------------------------------------------------- $token");
    });
  }

  void successLogin({required UserEntity userEntity, String? password, String? nationalId, bool fromJWT = false}) async {
    print('success');
    lastLogin = DateTime.now();
    CashMemmory.sharedPreferences.setBool('login', true);
    CashMemmory.sharedPreferences.setString('userToken', userEntity.token!);
    CashMemmory.sharedPreferences.setString('userName', userEntity.name!);
    this.userEntity = userEntity;
    ApiHandle.getInstance.updateHeader(userEntity.token!);
    if (!fromJWT) {
      print('success');
      await delay(100);
      Provider.of<LanguageProvider>(Constants.globalContext(), listen: false).rebuild();
      Provider.of<AttendanceProvider>(Constants.globalContext(), listen: false).goToLoactionHome();
      print("--------------------00000000-----------------------\n");
    }
    notifyListeners();
  }

  String? macAddress;
  Future<void> getUniqueId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        // Getting Android device info
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

        // Use androidInfo.id as a unique identifier (it is unique but not guaranteed to be permanent)
        macAddress = androidInfo.id;
        notifyListeners();
        print(macAddress); // This is a unique identifier for Android
      } else if (Platform.isIOS) {
        // Getting iOS device info
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

        // Use iosInfo.identifierForVendor as a unique identifier
        macAddress = iosInfo.identifierForVendor; // Unique for the app vendor
      }
    } catch (e) {
      showToast('Failed to get device unique ID: $e');
    }
    notifyListeners(); // Return null if not Android or iOS
  }

  void registerButton() async {
    bool isRgister = false;
    Map<String, dynamic> data = {};
    for (var element in registerInputs) {
      data[element.key!] = element.controller.text == '' ? null : element.controller.text;
    }
    data['macAddress'] = macAddress;
    if (!isRgister) loading();
    print("----------------------- >" + data.toString());
    Either<DioException, UserEntity> login = await UserUseCases(sl()).register(data);
    login.fold((l) {
    if (!isRgister) navPop();
      confirmDialog(
        l.response!.data["message"],
        'الغاء',
        () {
          isRgister = !isRgister;
          navPop();
          notifyListeners();
        },
      );

    }, (r) async {
      print("khaled zaki" + r.toString());
      Provider.of<AttendanceProvider>(Constants.globalContext(), listen: false).mylocation=null;
      // Provider.of<AttendanceProvider>(Constants.globalContext(),listen: false).toggeleState=false;
      // CashMemmory.sharedPreferences.setBool('toggeleState', Provider.of<AttendanceProvider>(Constants.globalContext(),listen: false).toggeleState!);
      successLogin(userEntity: r, password: data['password'], nationalId: data['userName']);
    });
  }

  // void logout() async {
  //   Map<String, dynamic> data = {};
  //   // data['token'] = "123";
  //   token = await FirebaseMessaging.instance.getToken() ?? "123";
  
  //   // AccessTokenFireBase accessTokenGetter = AccessTokenFireBase();
  //   // String token = await accessTokenGetter.getAccessToken();
  //   data['token'] = token;
  //   Either<DioException, bool> login = await UserUseCases(sl()).logout(data);
  //   login.fold((l) {
  //     showToast(l.message!);
  //   }, (r) async {
  //     successLogout();
  //     notifyListeners();
  //   });
  // }

  // void deleteAccount() async {
  //   Either<DioException, bool> login = await UserUseCases(sl()).deleteAccount();
  //   login.fold((l) {
  //     showToast(l.message!);
  //   }, (r) async {
  //     successLogout();
  //     notifyListeners();
  //   });
  // }

  // void confirmDeleteAccount() {
  //   confirmDialog(LanguageProvider.translate('buttons', "delete_account"),
  //       LanguageProvider.translate('buttons', "delete_account"), () {
  //     deleteAccount();
  //   });
  // }

  // void confirmLogoutAccount() {
  //   confirmDialog(LanguageProvider.translate('buttons', "logout"),
  //       LanguageProvider.translate('buttons', "logout"), () {
  //     logout();
  //   });
  // }

  void goToLoginPage() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('intro', true);
  loginInputs = [
    TextFieldModel(
      borderColor: Colors.grey,
      borderRadius: 4.w,
      gradientColor: AppColor.defaultgredint,
      key: "userName",
      fillColor: Colors.white30,
      titleWidgetColor: Colors.black,
      image: Images.copyIcon,
      validator: (val) {
        if (val!.length != 14) {
          return "يجب أن لا يقل او يذيد الرقم القومي  عن 14 أحرف";
        }
        if (!RegExp(r'^\d+$').hasMatch(val)) {
          return "يجب أن يحتوي  الرقم القومي على أرقام فقط";
        }
      },
      labelStyle: TextStyleClass.semiStyle(color: Colors.black),
      controller: TextEditingController(),
      label: "الرقم القومي",
      textInputType: TextInputType.phone,
      hint: "مثال : 3000905218535483",
      next: true,
    ),
    TextFieldModel(
      borderColor: Colors.grey,
      key: "password",
      borderRadius: 4.w,
      fillColor: Colors.white30,
      titleWidgetColor: Colors.black,
      image: Images.lockPassIcon,
      isPassword: true,
      validator: (val) {
        if (val!.length < 8) {
          return "يجب أن لا تقل كلمة المرور عن 8 أحرف";
        }
        if (!RegExp(r'[a-z]').hasMatch(val)) {
          return "يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل";
        }
        if (!RegExp(r'[A-Z]').hasMatch(val)) {
          return "يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل";
        }
        if (!RegExp(r'\d').hasMatch(val)) {
          return "يجب أن تحتوي كلمة المرور على رقم واحد على الأقل";
        }
        if (!RegExp(r'[\W_]').hasMatch(val)) {
          return "يجب أن تحتوي كلمة المرور على علامة مميزة واحدة على الأقل (مثل @، #، !)";
        }
      },
      labelStyle: TextStyleClass.semiStyle(color: Colors.black),
      controller: TextEditingController(),
      label: "pass",
      hint: "************",
      next: true,
    )
  ];

    navPARU(LoginPage());
  }

  void successLogout() {
    // userEntity = null;
    CashMemmory.sharedPreferences.remove('login');
    CashMemmory.sharedPreferences.remove('phone');
    CashMemmory.sharedPreferences.remove('pass');
    for (var i in loginInputs) {
      i.controller.clear();
    }
    navPARU(LoginPage());
  }

  // void updateProfileButton() async {
  //   Map<String, dynamic> data = {};
  //   for (var element in registerInputs) {
  //     data[element.key!] =
  //         element.controller.text == '' ? null : element.controller.text;
  //   }
  //   if (image != null && imageUpdated) {
  //     data['image'] = await MultipartFile.fromFile(image!.path);
  //   }
  //   if (data['phone'].toString().startsWith('0')) {
  //     data['phone'].toString().substring(1);
  //   }
  //   Either<DioException, UserEntity> login =
  //       await UserUseCases(sl()).updateProfile(data);
  //   login.fold((l) {
  //     showToast(l.message!);
  //   }, (r) async {
  //     userEntity = r;
  //     await delay(100);
  //     Provider.of<LanguageProvider>(Constants.globalContext(), listen: false)
  //         .rebuild();
  //     Provider.of<MainProvider>(Constants.globalContext(), listen: false)
  //         .setIndex(0);
  //     successDialog(then: () {
  //       navPop();
  //     });
  //     notifyListeners();
  //   });
  // }

  Future<void> requestLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Color getStepColor(int step) {
    return step <= index ? Colors.green : Colors.grey;
  }
  // void canRegister({bool isResend = false}) async {
  //   requestLocationPermission();
  //   print("helloo");
  //   Map<String, dynamic> data = {};
  //   print("LOULOUUU");
  //   loading();
  //   for (var element in registerInputs) {
  //     data[element.key!] = element.controller.text == '' ? null : element.controller.text;
  //   }
  //   Either<DioException, String> canRegister = await UserUseCases(sl()).canRegister(data);
  //   navPop();
  //   canRegister.fold((l) {
  //     showToast(l.message!);
  //   }, (r) async {
  //     Provider.of<OtpProvider>(Constants.globalContext(), listen: false).sendCodeFromRegister(code: r, isResend: isResend);
  //   });
  // }
}
