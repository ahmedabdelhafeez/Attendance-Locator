import 'package:attendance_and_departure/core/helper_function/api.dart';
import 'package:attendance_and_departure/features/attendance/data/models/attendance_model.dart';
import 'package:attendance_and_departure/features/attendance/data/models/today_attendace_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AttendanceRemoteDataSource {
  static Future<Either<DioException, AttendanceModel>> postLatAndLongAttendance(Map<String, dynamic> data) async {
    var response = await ApiHandle.getInstance.post('http://employeemanagementapis.runasp.net/api/Attendance/Attendance', data);
    return response.fold((l) => Left(l), (r) {
      return Right(AttendanceModel.fromJson(r.data));
    });
  }

  static Future<Either<DioException, AttendanceModel>> postLatAndLongDeparture(Map<String, dynamic> data) async {
    var response = await ApiHandle.getInstance.post('http://employeemanagementapis.runasp.net/api/Attendance/Departure', data);
    return response.fold((l) => Left(l), (r) {
      return Right(AttendanceModel.fromJson(r.data));
    });
  }

  static Future<Either<DioException,  List <TodayAttendaceModel>>> getTodayAttendacneEmployee(String id) async {
    var response = await ApiHandle.getInstance.get('http://employeemanagementapis.runasp.net/api/Reports/EmployeeHome/$id');
    return response.fold((l) => Left(l), (r) {
      return Right(returnlastFiveDayModel(r.data));
    });
  }

  static Future<Either<DioException, List<TodayAttendaceModel>>> getMonthlyAttendce(String month, String year) async {
    var response =
        await ApiHandle.getInstance.get('http://employeemanagementapis.runasp.net/api/Reports/MonthAttendanceEmployee?Year=$year&Month=$month');
    return response.fold((l) => Left(l), (r) {
      List<TodayAttendaceModel> monthlyList = [];
      for (var i in r.data) {
        monthlyList.add(TodayAttendaceModel.fromJson(i));
      }
      return Right(monthlyList);
    });
  }
}
