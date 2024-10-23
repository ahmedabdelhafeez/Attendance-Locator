import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/repositories/settings_repo.dart';
import '../data_sources/remote_settings_data_source.dart';
import '../models/settings_model.dart';

class SettingsRepoImpl implements SettingsRepo{

  @override
  Future<Either<DioException, bool>> contactUs(Map<String, dynamic> data) async{
    return RemoteSettingsDataSource.contactUs(data);
  }
  @override
  Future<Either<DioException, SettingsModel>> getSettings() async{
    return RemoteSettingsDataSource.getSettings();
  }

}