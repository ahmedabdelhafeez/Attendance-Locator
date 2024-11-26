import 'package:attendance_and_departure/features/attendance/data/datasources/attendance_remote.dart';
import 'package:attendance_and_departure/features/attendance/domain/entities/attendance_entity.dart';
import 'package:attendance_and_departure/features/attendance/domain/entities/today_attendance_entity.dart';
import 'package:attendance_and_departure/features/attendance/domain/repositories/attendace_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_exception.dart';

class AttendanceImplRepo implements AttendaceRepo {
  @override
  Future<Either<DioException, AttendanceEntity>> postLatAndLongAttendance(Map<String, dynamic> data) async {
    return AttendanceRemoteDataSource.postLatAndLongAttendance(data);
  }

  @override
  Future<Either<DioException, AttendanceEntity>> postLatAndLongDeparture(Map<String, dynamic> data) async {
    return AttendanceRemoteDataSource.postLatAndLongDeparture(data);
  }

  @override
  Future<Either<DioException, List <TodayAttendanceEntity>>> getTodayAttendacneEmployee(String id) async {
    return AttendanceRemoteDataSource.getTodayAttendacneEmployee(id);
  }

  @override
  Future<Either<DioException, List <TodayAttendanceEntity>>> getMonthlyAttendce(String month, String year) async {
    return AttendanceRemoteDataSource.getMonthlyAttendce(month, year);
  }
}
