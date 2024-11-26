import 'package:attendance_and_departure/features/attendance/data/repositories/attendance_impl_repo.dart';
import 'package:attendance_and_departure/features/attendance/domain/repositories/attendace_repo.dart';
import 'package:attendance_and_departure/features/auth/data/repositories/user_repo_impl.dart';
import 'package:attendance_and_departure/features/auth/domain/repositories/user_repo.dart';
import 'package:attendance_and_departure/features/report/data/repositories/report_impl_repo.dart';
import 'package:attendance_and_departure/features/report/domain/repositories/report_repo.dart';
import 'package:get_it/get_it.dart';
final sl=GetIt.instance;
Future<void> initializeDependencies() async {
 sl.registerSingleton<UserRepo>(UserRepoImpl());
 sl.registerSingleton<AttendaceRepo>(AttendanceImplRepo());
 sl.registerSingleton<ReportRepo>(ReportImplRepo());
}