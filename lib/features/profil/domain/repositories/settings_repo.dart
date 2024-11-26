import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../entities/settings_entity.dart';

abstract class SettingsRepo{
  Future<Either<DioException,bool>> contactUs(Map<String,dynamic> data);
  Future<Either<DioException,SettingsEntity>> getSettings();
}