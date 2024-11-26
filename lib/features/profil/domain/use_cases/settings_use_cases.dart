import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../entities/settings_entity.dart';
import '../repositories/settings_repo.dart';

class SettingsUseCases{

  SettingsRepo settingsRepo;

  SettingsUseCases(this.settingsRepo);

  Future<Either<DioException, bool>> contactUs(Map<String, dynamic> data) async{
    return settingsRepo.contactUs(data);
  }
  Future<Either<DioException, SettingsEntity>> getSettings() async{
    return settingsRepo.getSettings();
  }

}