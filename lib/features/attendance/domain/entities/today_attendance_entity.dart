class TodayAttendanceEntity {
  final String date;
  final String day;
  final String checkInTime;
  String? checkInLocationName;
  String? checkOutTime;
  String? checkOutLocationName;
  final int lateMinutes;
  final int earlyMinutes;
  TodayAttendanceEntity({
    required this.day,
    required this.date,
    required this.checkInTime,
    required this.checkInLocationName,
     this.checkOutTime,
     this.checkOutLocationName,
    required this.lateMinutes,
    required this.earlyMinutes,
  });
}
