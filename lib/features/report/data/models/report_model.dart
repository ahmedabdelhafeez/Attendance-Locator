import 'package:attendance_and_departure/features/report/domain/entities/report_entity.dart';

class ReportModel extends ReportEntity {
  ReportModel(
      {required super.name,
      required super.nationalId,
      required super.job,
       super.department,
      required super.shift,
      required super.shiftMinutes,
      required super.attendDays,
      required super.absentDays,
      required super.mainSalary,
      required super.lateMinutes,
      required super.overTimeMinutes,
      required super.attendancesDetails,
      required super.notWorkingTime,
     required  super.overTime,
      required super.dailySalary,
      required super.hourSalary,
      required super.minuteSalary,
      required super.deductionForLateMinutes,
      required super.additionalSalaryForExtraTime,
      required super.salaryAfterExtraTimeWorked,
      required super.salaryAfterLateHours,
      required super.remainSalary,
      required super.currentSalary});
  factory ReportModel.fromJson(Map data) {
    return ReportModel(
        name: data['name'],
        nationalId: data['nationalId'],
        job: data['job'],
        department: data['department'],
        shift: data['shift'],
        shiftMinutes: data['shiftMinutes'],
        attendDays: data['attendDays'],
        absentDays: data['absentDays'],
        mainSalary: data['mainSalary'],
        lateMinutes: data['lateMinutes'],
        overTimeMinutes: data['overTimeMinutes'],
        attendancesDetails: returnattendancesDetailList(data['attendancesDetails']),
        notWorkingTime: data['notWorkingTime'],
        overTime: data['overTime'],
        dailySalary: data['dailySalary'],
        hourSalary: data['hourSalary'],
        minuteSalary: data['minuteSalary'],
        deductionForLateMinutes: data['deductionForLateMinutes'],
        additionalSalaryForExtraTime: data['additionalSalaryForExtraTime'],
        salaryAfterExtraTimeWorked: data['salaryAfterExtraTimeWorked'],
        salaryAfterLateHours: data['salaryAfterLateHours'],
        remainSalary: data['remainSalary'],
        currentSalary: data['currentSalary']);
  }
}

class AttendancesDetailsModel extends AttendancesDetails {
  AttendancesDetailsModel({
    required super.date,
    required super.day,
    required super.checkInTime,
    required super.checkOutTime,
    required super.totalWorkHours,
    required super.lateMinutes,
    required super.overTimeMinutes,
  });
  factory AttendancesDetailsModel.fromJson(Map data) {
    return AttendancesDetailsModel(
      date: data['date'],
      day: data['day'],
      checkInTime: data['checkInTime'],
      totalWorkHours: data['totalWorkHours'],
      lateMinutes: data['lateMinutes'],
      overTimeMinutes: data['overTimeMinutes'],
      checkOutTime: data['checkOutTime'],
    );
  }
}

List<AttendancesDetailsModel> returnattendancesDetailList(List? data) {
  List<AttendancesDetailsModel> attendancesDetailList = [];
  if (data != null) {
    for (var i in data) {
      attendancesDetailList.add(AttendancesDetailsModel.fromJson(i));
    }
  }
  return attendancesDetailList;
}
