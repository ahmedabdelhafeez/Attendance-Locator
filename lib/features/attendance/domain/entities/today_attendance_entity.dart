class TodayAttendanceEntity {
  final List<LastFiveDaysEntity> lastFiveDays;
  final int employeeId;
  final String date;
  final String checkInTime;
  final String checkInLocationName;
  String? checkOutTime;
  String? checkOutLocationName;
  final int extraMinutesWorked;
  final int lateMinutes;
  final int earlyMinutes;
  TodayAttendanceEntity({
    required this.lastFiveDays,
    required this.employeeId,
    required this.date,
    required this.checkInTime,
    required this.checkInLocationName,
    required this.checkOutTime,
    this.checkOutLocationName,
    required this.extraMinutesWorked,
    required this.lateMinutes,
    required this.earlyMinutes,
  });
}

class LastFiveDaysEntity {
  final String date;
  final String checkInTime;
  String? checkOutTime;
  final int extraMinutesWorked;
  final int lateMinutes;
  final int earlyMinutes;

  LastFiveDaysEntity(
      {required this.date,
      required this.checkInTime,
      this.checkOutTime,
      required this.extraMinutesWorked,
      required this.lateMinutes,
      required this.earlyMinutes});
}


