import 'package:attendance_and_departure/features/attendance/domain/entities/attendance_entity.dart';
import 'package:attendance_and_departure/features/attendance/domain/entities/today_attendance_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
abstract class AttendaceRepo {
  Future<Either<DioException, AttendanceEntity>> postLatAndLongAttendance(Map<String, dynamic> data);
  Future<Either<DioException, AttendanceEntity>> postLatAndLongDeparture(Map<String, dynamic> data);
  Future<Either<DioException, List< TodayAttendanceEntity>>> getTodayAttendacneEmployee(String id);
  Future<Either<DioException, List <TodayAttendanceEntity>>> getMonthlyAttendce(String id,String year);
}