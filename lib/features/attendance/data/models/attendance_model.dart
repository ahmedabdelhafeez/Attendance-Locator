import 'package:attendance_and_departure/features/attendance/domain/entities/attendance_entity.dart';

class AttendanceModel extends AttendanceEntity {
  AttendanceModel({required super.latitude, required super.longitude, required super.location, required super.detail, required super.token});
  factory AttendanceModel.fromJson(Map data) {
    return AttendanceModel(
        latitude: data['latitude'], longitude: data['longitude'], location: data['location'], detail: data['detail'], token: data['token']);
  }
}
