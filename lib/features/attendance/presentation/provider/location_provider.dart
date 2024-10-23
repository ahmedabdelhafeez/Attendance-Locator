import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/dialog/confirm_dialog.dart';
import 'package:attendance_and_departure/core/dialog/snack_bar.dart';
import 'package:attendance_and_departure/core/helper_function/convert.dart';
import 'package:attendance_and_departure/core/helper_function/loading.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/helper_function/prefs.dart';
import 'package:attendance_and_departure/features/attendance/domain/entities/attendance_entity.dart';
import 'package:attendance_and_departure/features/attendance/domain/entities/today_attendance_entity.dart';
import 'package:attendance_and_departure/features/attendance/domain/usecases/attendace_use_case.dart';
import 'package:attendance_and_departure/features/attendance/presentation/pages/loacation_page.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:attendance_and_departure/features/home/presentation/pages/home_page.dart';
import 'package:attendance_and_departure/injection_container.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AttendanceProvider extends ChangeNotifier {
  String? attendanceTime;
  String? dependanceTime;
  String? attendeceLocation;
  String? dependancelocation;
  bool attendace = false;
  bool depeture = false;
  bool _isAnimating = false;
  bool iSloading = false;
  Position? position;
  String? mylocation;
  double? lat;
  AttendanceEntity? attendanceEntity;
  AttendanceEntity? dePetureEntity;
  TodayAttendanceEntity? todayEntity;
  double? long;
  List<LastFiveDaysEntity>listLastFiveDaysEntity=[];
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
        showToast("عليك تفعيل خيار تحديد المواقع");
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
      print(lat);
      print(long);
      print(check);
      if (check == 0) {
        postLatAndLongAttendance();
        // confirmDialog(
        //     'هل انت متاكد من تسجيل الحضور',
        //     'تاكيد',
        //     () {
        //       postLatAndLongAttendance();
        //       navPop();
        //     },
        //     cancel: 'الغاء',
        //     cancelTap: () {
        //       navPop();
        //     });
      }
      if (check == 1) {
        postLatAndLongDeparture();
        // confirmDialog(
        //     'هل انت متاكد من تسجيل الانصراف',
        //     'تاكيد',
        //     () {
        //       postLatAndLongDeparture();
        //       navPop();
        //     },
        //     cancel: 'الغاء',
        //     cancelTap: () {
        //       navPop();
        //     });
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
    attendace = CashMemmory.getData(key: 'attendace') ?? false;
    depeture = CashMemmory.getData(key: 'depeture') ?? false;
    dependancelocation = CashMemmory.getData(key: 'dependancelocation') ?? 'المكان لم يحدد بعد';
    attendeceLocation = CashMemmory.getData(key: 'attendeceLocation') ?? 'المكان لم يحدد بعد';
    Provider.of<AuthProvider>(Constants.globalContext(), listen: false).userName = CashMemmory.getData(key: 'userName');
    attendanceTime = CashMemmory.getData(key: 'attendanceTime');
    dependanceTime = CashMemmory.getData(key: 'dependanceTime');
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
      getTodayAttendacneEmployee(r.token.toString());
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
      getTodayAttendacneEmployee(r.token.toString());
      dependanceTime = convertDateTimeToString(DateTime.now());
      CashMemmory.sharedPreferences.setString('time', dependanceTime!);
      dePetureEntity = r;
      dependancelocation = dePetureEntity!.location;
      print(dependancelocation);
      CashMemmory.sharedPreferences.setString('attendanceTime', attendanceTime!);
      CashMemmory.sharedPreferences.setString('dependancelocation', dePetureEntity!.location!);
      depeture = !depeture;
      CashMemmory.sharedPreferences.setBool('depeture', depeture);
      showToast('تم التسجيل الانصراف');
      notifyListeners();
    });
  }

  Future getTodayAttendacneEmployee(String token) async {
    //token = await FirebaseMessaging.instance.getToken() ?? "123";
    Map<String, dynamic> data = {};
    data['token'] = token;
    Either<DioException, TodayAttendanceEntity> postAttendance = await AttendaceUseCase(sl()).getTodayAttendacneEmployee(data);
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
      todayEntity = r;
      listLastFiveDaysEntity=todayEntity!.lastFiveDays;
      print("************************************" + r.toString());
      print("************************************" + r.lastFiveDays.toString());
      notifyListeners();
    });
  }
}
