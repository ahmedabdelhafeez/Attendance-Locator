import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/helper_function/api.dart';
import '../models/settings_model.dart';

class RemoteSettingsDataSource {
  static Future<Either<DioException, bool>> contactUs(Map<String, dynamic> data) async {
    var response = await ApiHandle.getInstance.post('contact_us', data);
    return response.fold((l) => Left(l), (r) {
      return const Right(true);
    });
  }

  static Future<Either<DioException, SettingsModel>> getSettings() async {
    var response = await ApiHandle.getInstance.get('get_settings');
    SettingsModel settingsModel;
    return response.fold((l) => Left(l), (r) {
      settingsModel = SettingsModel.fromJson(r.data['data']);
      return Right(settingsModel);
    });
  }
}
