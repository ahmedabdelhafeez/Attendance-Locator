import 'package:attendance_and_departure/core/helper_function/api.dart';
import 'package:attendance_and_departure/features/report/data/models/report_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RemotReportDataSource {
  static Future<Either<DioException, ReportModel>> getEmployeeReport(String id) async {
    var response = await ApiHandle.getInstance.get('http://employeemanagementapis.runasp.net/api/Reports/EmployeeSalaryDetails/$id');
    return response.fold((l) => Left(l), (r) {
      return Right(ReportModel.fromJson(r.data));
    });
  }
}
