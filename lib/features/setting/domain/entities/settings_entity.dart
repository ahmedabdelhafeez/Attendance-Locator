import 'package:equatable/equatable.dart';

class SettingsEntity extends Equatable {
  final int id;
  final String phone;
  final bool mustUpdate;
  final int version;
  final num kmPrice;
  final String termsLink;
  final String privacyLink;
  final String aboutLink;

  const SettingsEntity(
      {required this.kmPrice,
      required this.id,
      required this.phone,
      required this.termsLink,
      required this.privacyLink,
      required this.aboutLink,
      required this.mustUpdate,
      required this.version});

  @override
  List<Object?> get props => [id, phone, kmPrice, termsLink, privacyLink, aboutLink, mustUpdate, version];
}
