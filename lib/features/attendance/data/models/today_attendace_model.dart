import 'package:attendance_and_departure/features/attendance/domain/entities/today_attendance_entity.dart';

class TodayAttendaceModel extends TodayAttendanceEntity {
  TodayAttendaceModel({
    required super.date,
    required super.day,
    required super.checkInTime,
    required super.checkInLocationName,
    required super.lateMinutes,
    required super.earlyMinutes,
    super.checkOutTime,
    super.checkOutLocationName,
  });
  factory TodayAttendaceModel.fromJson(Map data) {
    return TodayAttendaceModel(
      date: data['date'],
      day: data['day'],
      checkInTime: data['checkInTime'],
      checkOutTime: data['checkOutTime'],
      checkInLocationName: data['checkInLocation'],
      checkOutLocationName: data['checkOutLocation'],
      lateMinutes: data['lateMinutes'],
      earlyMinutes: data['earlyMinutes'],
    );
  }
}

List<TodayAttendaceModel> returnlastFiveDayModel(List? data) {
  List<TodayAttendaceModel> listTodayAttendaceModel = [];
  if (data != null) {
    for (var i in data) {
      listTodayAttendaceModel.add(TodayAttendaceModel.fromJson(i));
    }
  }
  return listTodayAttendaceModel;
}
