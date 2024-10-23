//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:attendance_and_departure/features/auth/domain/entities/transaction_entity.dart';
// import 'package:attendance_and_departure/features/auth/domain/repositories/user_repo.dart';
//
// import '../entities/user_entity.dart';
//
 import 'package:attendance_and_departure/features/auth/domain/entities/user_entity.dart';
import 'package:attendance_and_departure/features/auth/domain/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserUseCases{
   UserRepo userRepo;
   UserUseCases(this.userRepo);
  Future<Either<DioException, UserEntity>> login(Map<String, dynamic> data) async{
    return await  userRepo.login(data);
  }
  Future<Either<DioException, UserEntity>> register(Map<String, dynamic> data) async{
    return await  userRepo.register(data);
  }
 }