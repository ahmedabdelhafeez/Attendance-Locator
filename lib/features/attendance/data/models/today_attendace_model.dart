import 'package:attendance_and_departure/features/attendance/domain/entities/today_attendance_entity.dart';

class TodayAttendaceModel extends TodayAttendanceEntity {
  TodayAttendaceModel({
    required super.lastFiveDays,
    required super.employeeId,
    required super.date,
    required super.checkInTime,
    required super.checkInLocationName,
    required super.extraMinutesWorked,
    required super.lateMinutes,
    required super.earlyMinutes,
    super.checkOutTime,
    super.checkOutLocationName,
  });
  factory TodayAttendaceModel.fromJson(Map data) {
    return TodayAttendaceModel(
      lastFiveDays: returnlastFiveDayModel(data['lastFiveDays']),
      employeeId: data['employeeId'],
      date: data['date'],
      checkInTime: data['checkInTime'],
      checkOutTime: data['checkOutTime'],
      checkInLocationName: data['checkInLocationName'],
      checkOutLocationName: data['checkOutLocationName'],
      extraMinutesWorked: data['extraMinutesWorked'],
      lateMinutes: data['lateMinutes'],
      earlyMinutes: data['earlyMinutes'],
    );
  }
}

class LastFiveDaysModel extends LastFiveDaysEntity {
  LastFiveDaysModel({
    required super.date,
    required super.checkInTime,
    required super.checkOutTime,
    required super.extraMinutesWorked,
    required super.lateMinutes,
    required super.earlyMinutes,
  });
  factory LastFiveDaysModel.fromJson(Map data) {
    return LastFiveDaysModel(
      date: data['date'],
      checkInTime: data['checkInTime'],
      checkOutTime: data['checkOutTime'],
      extraMinutesWorked: data['extraMinutesWorked'],
      lateMinutes: data['lateMinutes'],
      earlyMinutes: data['earlyMinutes'],
    );
  }
}

List<LastFiveDaysModel> returnlastFiveDayModel(List? data) {
  List<LastFiveDaysModel> listlastFiveDay = [];
  if (data != null) {
    for (var i in data) {
      listlastFiveDay.add(LastFiveDaysModel.fromJson(i));
    }
  }
  return listlastFiveDay;
}
