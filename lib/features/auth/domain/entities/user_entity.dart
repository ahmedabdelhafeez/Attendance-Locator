import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
final int? userId;
String? name;  
String? token;  
String? nationalId;
String? password;
String? macAddress;
UserEntity({
 this.nationalId,
 this.password,
required this.userId,
 this.name,
 this.macAddress,
 this.token
  });
  @override
  List<Object?> get props => [
nationalId,
password,
name,
macAddress,
userId,
token
      ];
}
