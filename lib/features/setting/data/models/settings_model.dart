import 'dart:io';

import 'package:attendance_and_departure/core/helper_function/convert.dart';

import '../../domain/entities/settings_entity.dart';

class SettingsModel extends SettingsEntity {
  const SettingsModel(
      {required super.id,
      required super.phone,
      required super.termsLink,
      required super.privacyLink,
      required super.aboutLink,
      required super.mustUpdate,
      required super.version,
      required super.kmPrice});

  factory SettingsModel.fromJson(Map data) {
    return SettingsModel(
      id: data['id'],
      phone: data['phone'],
      kmPrice: convertDataToDouble(data['km_price']),
      termsLink: data['terms_link'],
      privacyLink: data['privacy_link'],
      aboutLink: data['about_link'],
      version: convertStringToInt(data[Platform.isIOS ? 'market_version_ios' : 'market_version']),
      mustUpdate: convertDataToBool(data[Platform.isIOS ? "must_update_market_ios" : 'must_update_market']),
    );
  }
}
