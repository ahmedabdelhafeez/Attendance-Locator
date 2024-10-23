import 'package:attendance_and_departure/features/auth/domain/entities/error_entity.dart';

class ErrorModel extends ErrorEntity {
  ErrorModel({required super.type, required super.title, required super.detail, required super.status, required super.error});
   factory ErrorModel.fromJson(Map data) {
    return ErrorModel(
      type:data['type'],
      title: data['title'],
      detail: data['detail'],
      status: data['status'],
      error: data['error'],
    );
  }

}