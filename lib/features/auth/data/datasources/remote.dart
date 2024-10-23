import 'package:attendance_and_departure/core/helper_function/api.dart';
import 'package:attendance_and_departure/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  static Future<Either<DioException, UserModel>> register(Map<String, dynamic> data) async {
    var response = await ApiHandle.getInstance.post('http://employeemanagementapis.runasp.net/api/Auth/Register', data);
    return response.fold((l) => Left(l), (r) {
      return Right(UserModel.fromJson(r.data));
    });
  }

  static Future<Either<DioException, UserModel>> login(Map<String, dynamic> data) async {
    var response = await ApiHandle.getInstance.post('http://employeemanagementapis.runasp.net/api/Auth/Login', data);
    return response.fold((l) => Left(l), (r) {
      return Right(UserModel.fromJson(r.data));
    });
  }
}
