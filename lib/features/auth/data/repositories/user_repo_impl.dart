import 'package:attendance_and_departure/features/auth/data/datasources/remote.dart';
import 'package:attendance_and_departure/features/auth/data/models/user_model.dart';
import 'package:attendance_and_departure/features/auth/domain/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserRepoImpl implements UserRepo {
  @override
  Future<Either<DioException, UserModel>> login(Map<String, dynamic> data) async {
    return await AuthRemoteDataSource.login(data);
  }

  @override
  Future<Either<DioException, UserModel>> register(Map<String, dynamic> data) async {
    return await AuthRemoteDataSource.register(data);
  }
}
