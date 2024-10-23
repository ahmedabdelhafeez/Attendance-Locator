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
   static Future<Either<DioException, TodayAttendaceModel>> getTodayAttendacneEmployee(Map<String, dynamic> data) async {
    var response = await ApiHandle.getInstance.get('http://employeemanagementapis.runasp.net/api/Reports/ToDayAttendanceEmployee', data);
    return response.fold((l) => Left(l), (r) {
      return Right(TodayAttendaceModel.fromJson(r.data));
    });
  }

}