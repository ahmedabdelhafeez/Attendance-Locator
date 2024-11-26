import 'package:attendance_and_departure/features/report/domain/entities/report_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
abstract class ReportRepo {
  Future<Either<DioException, ReportEntity>> getEmployeeReport(String id);
}