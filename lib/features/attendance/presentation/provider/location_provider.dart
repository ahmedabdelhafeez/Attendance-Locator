import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/dialog/confirm_dialog.dart';
import 'package:attendance_and_departure/core/dialog/snack_bar.dart';
import 'package:attendance_and_departure/core/helper_function/convert.dart';
import 'package:attendance_and_departure/core/helper_function/loading.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/helper_function/prefs.dart';
import 'package:attendance_and_departure/core/models/text_field_model.dart';
import 'package:attendance_and_departure/features/attendance/domain/entities/attendance_entity.dart';
import 'package:attendance_and_departure/features/attendance/domain/entities/today_attendance_entity.dart';
import 'package:attendance_and_departure/features/attendance/domain/usecases/attendace_use_case.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:attendance_and_departure/features/home/presentation/pages/home_page.dart';
import 'package:attendance_and_departure/features/report/presentation/provider/report_provider.dart';
import 'package:attendance_and_departure/injection_container.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AttendanceProvider extends ChangeNotifier {
  String? attendanceTime;
  String? dependanceTime;
  String? attendeceLocation;
  List<TodayAttendanceEntity>? listTodayAttendaceModel;
  String? dependancelocation;
  bool attendace = false;
  bool depeture = false;
  bool isMotorcycleVisible = false;
  bool hodor = false;
  bool _isAnimating = false;
  bool iSloading = false;
  Position? position;
  String? mylocation;
  double? lat;
  AttendanceEntity? attendanceEntity;
  AttendanceEntity? dePetureEntity;
  TodayAttendanceEntity? todayEntity;
  List<TodayAttendanceEntity>? monthlyAttendce;
  double? long;
  List<TodayAttendanceEntity> listLastSixDaysEntity = [];
  bool get isAnimating => _isAnimating;
  void startAnimation() {
    _isAnimating = true;
    notifyListeners();
  }

  void stopAnimation() {
    _isAnimating = false;
    notifyListeners();
  }

  // void toggeleBoolState() {
  //   toggeleState = !toggeleState!;
  //   print("**************************************************$toggeleState");
  //   CashMemmory.sharedPreferences.setBool('toggeleState', toggeleState!);
  //   notifyListeners();
  // }
  void carToggle() {
    isMotorcycleVisible = true;
    print(isMotorcycleVisible.toString());
    notifyListeners();
  }

  Future<void> getCurrentLocation(int check) async {
    bool serviceEnabled;
    LocationPermission permission;
    var connectivityResult = await (Connectivity().checkConnectivity());

    // Check internet connection before proceeding
    if (connectivityResult == ConnectivityResult.none) {
      showToast("لا يوجد اتصال بالانترنت من فضلك تاكد من اتصالك بالانترنت");
      return;
    }
    try {
      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Show a toast if location services are disabled
        showToast("عليك تفعيل خيار تحديد المواقع", color: Colors.red);
        return;
      }

      // Check if the app has location permissions
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        // Request permissions if not granted
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          showToast("Location permissions are denied.");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are permanently denied
        showToast("Location permissions are permanently denied.");
        return;
      }
      if (position == null) {
        iSloading = true;
        loading();
      }
      // If everything is enabled and permissions are granted, proceed with getting the location
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      lat = position!.latitude;
      long = position!.longitude;
      if (check == 0) {
        postLatAndLongAttendance();
      }
      if (check == 1) {
        postLatAndLongDeparture();
      }
      notifyListeners();
    } catch (e) {
      // Handle any errors or exceptions
      showToast("An error occurred: ${e.toString()}");
    }

    position = null;
    if (iSloading == true) {
      navPop();
      iSloading = false;
    }

    notifyListeners();
  }

  void goToLoactionHome() {
    // attendace = CashMemmory.getData(key: 'attendace') ?? false;
    // depeture = CashMemmory.getData(key: 'depeture') ?? false;
    // dependancelocation = CashMemmory.getData(key: 'dependancelocation') ?? 'المكان لم يحدد بعد';
    // attendeceLocation = CashMemmory.getData(key: 'attendeceLocation') ?? 'المكان لم يحدد بعد';
    Provider.of<AuthProvider>(Constants.globalContext(), listen: false).userName = CashMemmory.getData(key: 'userName');
    // attendanceTime = CashMemmory.getData(key: 'attendanceTime');
    // dependanceTime = CashMemmory.getData(key: 'dependanceTime');
    // print('/************/**/*/*/*/' + CashMemmory.getData(key: 'UserId'));

    navPARU(HomePage());
    notifyListeners();
  }

  Future postLatAndLongAttendance({bool fromSplash = false, bool fromJWT = false}) async {
    //token = await FirebaseMessaging.instance.getToken() ?? "123";
    Map<String, dynamic> data = {};
    data['latitude'] = lat;
    data['longitude'] = long;
    // data['token'] = token;
    Either<DioException, AttendanceEntity> postAttendance = await AttendaceUseCase(sl()).postLatAndLongAttendance(data);
    postAttendance.fold((l) {
      confirmDialog(
        l.response!.data["message"],
        'الغاء',
        () {
          navPop();
          notifyListeners();
        },
      );
    }, (r) async {
      getEmployeeHome(CashMemmory.getData(key: 'UserId'));
      Provider.of<ReportProvider>(Constants.globalContext(), listen: false).getEmployeeReport(CashMemmory.getData(key: 'UserId'));
      attendanceEntity = r;
      attendeceLocation = attendanceEntity!.location;
      print(mylocation);
      attendanceTime = convertDateTimeToString(DateTime.now());
      CashMemmory.sharedPreferences.setString('attendanceTime', attendanceTime!);
      CashMemmory.sharedPreferences.setString('attendeceLocation', attendanceEntity!.location!);
      attendace = !attendace;
      CashMemmory.sharedPreferences.setBool('attendace', attendace);
      showToast('تم سجيل الحضور لهذا اليوم');

      notifyListeners();
    });
  }

  Future postLatAndLongDeparture({bool fromSplash = false, bool fromJWT = false}) async {
    //token = await FirebaseMessaging.instance.getToken() ?? "123";
    Map<String, dynamic> data = {};
    data['latitude'] = lat;
    data['longitude'] = long;
    // data['token'] = token;
    Either<DioException, AttendanceEntity> postAttendance = await AttendaceUseCase(sl()).postLatAndLongDeparture(data);
    postAttendance.fold((l) {
      confirmDialog(
        l.response!.data["message"],
        'الغاء',
        () {
          navPop();
          notifyListeners();
        },
      );
    }, (r) async {
      getEmployeeHome(CashMemmory.getData(key: 'UserId'));
      Provider.of<ReportProvider>(Constants.globalContext(), listen: false).getEmployeeReport(CashMemmory.getData(key: 'UserId'));
      dependanceTime = convertDateTimeToString(DateTime.now());
      CashMemmory.sharedPreferences.setString('time', dependanceTime!);
      dePetureEntity = r;
      dependancelocation = dePetureEntity!.location;
      print(dependancelocation);
      isMotorcycleVisible = !isMotorcycleVisible;
      showToast('تم التسجيل الانصراف');
      notifyListeners();
    });
  }

  Future getEmployeeHome(String id) async {
    Either<DioException, List<TodayAttendanceEntity>> postAttendance = await AttendaceUseCase(sl()).getTodayAttendacneEmployee(id);
    postAttendance.fold((l) {
      confirmDialog(
        l.response!.data["message"],
        'حسناً',
        () {
          navPop();
          notifyListeners();
        },
      );
    }, (r) async {
      listTodayAttendaceModel = r;
      listLastSixDaysEntity = r;

      print('-----------khale---------------->' + r.toString());
      // listLastFiveDaysEntity = todayEntity!.lastFiveDays;
      // print("************************************" + r.toString());
      // print("************************************" + r.lastFiveDays.toString());
      notifyListeners();
    });
  }

  List<TextFieldModel> selectPeroid = [
    TextFieldModel(
      borderColor: Colors.grey,
      borderRadius: 4.w,
      gradientColor: AppColor.defaultgredint,
      key: "year",
      fillColor: Colors.white30,
      titleWidgetColor: Colors.black,
      image: Images.dateIcon,
      labelStyle: TextStyleClass.semiStyle(color: Colors.black),
      controller: TextEditingController(),
      label: "السنة",
      validator: (val) {
        if (val!.length != 4) {
          return "يجب أن لا يقل او يذيد رقم السنة  عن 4 أحرف";
        }
        if (!RegExp(r'^\d+$').hasMatch(val)) {
          return "يجب أن يحتوي  النص علي  أرقام فقط";
        }
      },
      textInputType: TextInputType.phone,
      hint: "مثال : 2024",
      next: true,
    ),
    TextFieldModel(
      borderColor: Colors.grey,
      borderRadius: 4.w,
      gradientColor: AppColor.defaultgredint,
      key: "month",
      fillColor: Colors.white30,
      titleWidgetColor: Colors.black,
      image: Images.dateIcon,
      labelStyle: TextStyleClass.semiStyle(color: Colors.black),
      controller: TextEditingController(),
      label: "الشهر",
      validator: (val) {
        if (val!.length > 2) {
          return "يجب أن لا يقل او يذيد رقم الشهر  عن 2 أحرف";
        }
        if (!RegExp(r'^\d+$').hasMatch(val)) {
          return "يجب أن يحتوي  النص علي  أرقام فقط";
        }
        if (val == '0' || int.parse(val) > 12) {
          return "ادخال الارقام فقد من 1 الي 12";
        }
      },
      textInputType: TextInputType.phone,
      hint: "مثال : 10",
      next: true,
    ),
  ];
  String? month;
  String? year;
  Future getMonthlyAttendce() async {
    year = selectPeroid.firstWhere((element) => element.key == 'year').controller.text;
    month = selectPeroid.firstWhere((element) => element.key == 'month').controller.text;
    Either<DioException, List<TodayAttendanceEntity>> postAttendance = await AttendaceUseCase(sl()).getMonthlyAttendce(month!, year!);
    postAttendance.fold((l) {
      confirmDialog(
        l.response!.data["message"],
        'الغاء',
        () {
          navPop();
          notifyListeners();
        },
      );
    }, (r) async {
      loading();
      monthlyAttendce = r;
      print(monthlyAttendce);
      notifyListeners();
      navPop();
    });
  }
}
