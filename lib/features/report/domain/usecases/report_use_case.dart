import 'package:attendance_and_departure/features/report/domain/entities/report_entity.dart';
import 'package:attendance_and_departure/features/report/domain/repositories/report_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ReportUseCase {
  ReportRepo reportRepo;
  ReportUseCase(this.reportRepo);
  Future<Either<DioException, ReportEntity>> getEmployeeReport(String id) async {
    return await reportRepo.getEmployeeReport(id);
  }
}
