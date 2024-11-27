class ReportEntity {
  final String name;
  final String nationalId;
  final String job;
  final String? department;
  final String shift;
  final int shiftMinutes;
  final int attendDays;
  final int absentDays;
  final int mainSalary;
  final int lateMinutes;
  final int overTimeMinutes;
  final List<AttendancesDetails> attendancesDetails;
  final String notWorkingTime;
  final String overTime;
  final dynamic dailySalary;
  final dynamic hourSalary;
  final dynamic minuteSalary;
  final dynamic deductionForLateMinutes;
  final dynamic additionalSalaryForExtraTime;
  final dynamic salaryAfterLateHours;
  final dynamic salaryAfterExtraTimeWorked;
  final dynamic remainSalary;
  final dynamic currentSalary;
  ReportEntity({
    required this.name,
    required this.nationalId,
    required this.job,
    required this.department,
    required this.shift,
    required this.shiftMinutes,
    required this.attendDays,
    required this.absentDays,
    required this.mainSalary,
    required this.lateMinutes,
    required this.overTimeMinutes,
    required this.attendancesDetails,
    required this.notWorkingTime,
    required this.overTime,
    required this.dailySalary,
    required this.hourSalary,
    required this.minuteSalary,
    required this.deductionForLateMinutes,
    required this.additionalSalaryForExtraTime,
    required this.salaryAfterExtraTimeWorked,
    required this.salaryAfterLateHours,
    required this.remainSalary,
    required this.currentSalary,
  });
}

class AttendancesDetails {
  final String date;
  final String day;
  final String checkInTime;
  final String? checkOutTime;
  final String totalWorkHours;
  final int lateMinutes;
  final int overTimeMinutes;
  AttendancesDetails({
    required this.date,
    required this.day,
    required this.checkInTime,
    required this.checkOutTime,
    required this.totalWorkHours,
    required this.lateMinutes,
    required this.overTimeMinutes,
  });
}
