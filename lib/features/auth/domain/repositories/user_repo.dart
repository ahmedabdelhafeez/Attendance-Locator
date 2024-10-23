import 'package:attendance_and_departure/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class UserRepo {
  Future<Either<DioException, UserEntity>> register(Map<String, dynamic> data);
  Future<Either<DioException, UserEntity>> login(Map<String, dynamic> data);
}
