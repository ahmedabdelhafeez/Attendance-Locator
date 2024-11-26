import 'package:attendance_and_departure/core/dialog/snack_bar.dart';
import 'package:attendance_and_departure/core/widget/shimmer_text_widget.dart';
import 'package:attendance_and_departure/features/home/presentation/widgets/header_widegt.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/dialog/confirm_dialog.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AttendanceProvider attendanceProvider = Provider.of<AttendanceProvider>(context);
    var connectivityResult = Connectivity().checkConnectivity();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AttendanceCard(
          title: 'تسجيل الحضور',
          icon: Images.checkIn,
          onTap: () {
            if (connectivityResult == ConnectivityResult.none) {
              confirmDialog(
                'تحقق من الاتصال بالانترنت',
                'حسناً',
                () {
                  Navigator.pop(context);
                },
              );
            } else if (attendanceProvider.listLastSixDaysEntity.length != 0 &&
                attendanceProvider.listLastSixDaysEntity[0].date == DateFormat('dd/MM/yyyy').format(DateTime.now())) {
              showToast('سجلت من قبل', color: Colors.green);
            } else {
              _showConfirmationDialog(
                context,
                'هل انت متاكد من تسجيل الحضور',
                () => attendanceProvider.getCurrentLocation(0),
              );
            }
          },
        ),
        _AttendanceCard(
          title: 'تسجيل الانصراف',
          icon: Images.checkOut,
          onTap: () {
            if (connectivityResult == ConnectivityResult.none) {
              confirmDialog(
                'تحقق من الاتصال بالانترنت',
                'حسناً',
                () {
                  Navigator.pop(context);
                },
              );
            } else if (attendanceProvider.listLastSixDaysEntity.length != 0 &&
                attendanceProvider.listLastSixDaysEntity[0].date == DateFormat('dd/MM/yyyy').format(DateTime.now()) &&
                attendanceProvider.listLastSixDaysEntity[0].checkOutTime != null) {
              showToast('سجلت من قبل');
            } else {
              _showConfirmationDialog(context, 'هل انت متاكد من تسجيل الانصراف', () {
                attendanceProvider.getCurrentLocation(1);
              });
            }
          },
        ),
      ],
    );
  }

  Future<void> _showConfirmationDialog(
    BuildContext context,
    String message,
    VoidCallback onConfirm,
  ) async {
    confirmDialog(
      message,
      'تاكيد',
      () {
        onConfirm();
        navPop();
      },
      cancel: 'الغاء',
      cancelTap: navPop,
    );
  }
}

class _AttendanceCard extends StatelessWidget {
  const _AttendanceCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Material(
        elevation: 1.w,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
        child: Container(
          //width: 45.w,

          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.black.withOpacity(0.5), width: 1.w),
                right: BorderSide(color: Colors.black.withOpacity(0.5), width: 1.w)),
            borderRadius: BorderRadius.circular(3.w),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 5.w,
                    backgroundColor: const Color(0xFFF6F7F9),
                    child: Image.asset(icon, width: 5.w),
                  ),
                  SizedBox(width: 2.w),
                  ShimmerTextWidget(
                      gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
                      child: Text(
                        title,
                        style: TextStyleClass.normalBoldStyle(color: Colors.black),
                      ),
                      shimmerDirection: ShimmerDirection.btt,
                      enabled: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//info.listLastSixDaysEntity[0].day!=DateFormat('MM/dd/yyyy').format(DateTime.now())