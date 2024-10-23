//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:attendance_and_departure/features/auth/domain/entities/transaction_entity.dart';
// import 'package:attendance_and_departure/features/auth/domain/repositories/user_repo.dart';
//
// import '../entities/user_entity.dart';
//
import 'package:attendance_and_departure/features/attendance/domain/entities/attendance_entity.dart';
import 'package:attendance_and_departure/features/attendance/domain/entities/today_attendance_entity.dart';
import 'package:attendance_and_departure/features/attendance/domain/repositories/attendace_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AttendaceUseCase{
   AttendaceRepo attendaceRepo;
   AttendaceUseCase(this.attendaceRepo);
  Future<Either<DioException, AttendanceEntity>> postLatAndLongAttendance(Map<String, dynamic> data) async{
    return await  attendaceRepo.postLatAndLongAttendance(data);
  }
  Future<Either<DioException, AttendanceEntity>> postLatAndLongDeparture(Map<String, dynamic> data) async{
    return await  attendaceRepo.postLatAndLongDeparture(data);
  }
    Future<Either<DioException, TodayAttendanceEntity>> getTodayAttendacneEmployee(Map<String, dynamic> data) async{
    return await  attendaceRepo.getTodayAttendacneEmployee(data);
  }
 }