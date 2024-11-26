import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/dialog/confirm_dialog.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/helper_function/prefs.dart';
import 'package:attendance_and_departure/features/report/domain/entities/report_entity.dart';
import 'package:attendance_and_departure/features/report/domain/usecases/report_use_case.dart';
import 'package:attendance_and_departure/features/profil/presentation/page/profile_page.dart';
import 'package:attendance_and_departure/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ReportProvider extends ChangeNotifier {
  ReportEntity? reportEntity;
  List? attendancesDetails;
  Future getEmployeeReport(String id) async {
    Either<DioException, ReportEntity> postAttendance = await ReportUseCase(sl()).getEmployeeReport(id);
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
      reportEntity = r;
      print("****************Report*************" + r.attendancesDetails.toString());
      attendancesDetails = r.attendancesDetails;
      //  print("************************************" + r.lastFiveDays.toString());
      notifyListeners();
    });
  }

  void goToProfilePage() async {
    Navigator.push(
      Constants.globalContext(),
      PageTransition(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 700),
        type: PageTransitionType.rightToLeft, // You can change this to different types
        child: ProfilePAge(),
      ),
    );
    // navP(PageTransition(child: AccountSettingsPage(), type: PageTransitionType.rightToLeft));
  }
}
