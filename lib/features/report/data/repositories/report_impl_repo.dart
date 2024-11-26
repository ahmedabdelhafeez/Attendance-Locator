import 'package:attendance_and_departure/features/report/data/datasources/remot_report_data_source.dart';
import 'package:attendance_and_departure/features/report/domain/entities/report_entity.dart';
import 'package:attendance_and_departure/features/report/domain/repositories/report_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_exception.dart';

class ReportImplRepo implements ReportRepo {
  @override
  Future<Either<DioException, ReportEntity>> getEmployeeReport(String id) {
    return RemotReportDataSource.getEmployeeReport(id);
  }
}
