
import 'package:attendance_and_departure/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
UserModel({
  super.name,
  super.userId,
  super.token,
  super.macAddress,
  super.nationalId,  super.password});
  factory UserModel.fromJson(Map data) {
    return UserModel(
      macAddress:data['macAddress'],
      userId: data['userId'],
      token: data['token'],
      name: data['name'],
      nationalId: data['nationalId'],
      password: data['password'],
    );
  }
}
    