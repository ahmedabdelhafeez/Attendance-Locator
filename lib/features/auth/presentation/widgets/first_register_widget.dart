import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_and_departure/core/widget/list_text_field.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';

class FirstRegisterWidget extends StatelessWidget {
  const FirstRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: <Widget>[
          ListTextFieldWidget(inputs: auth.registerInputs),
          SizedBox(height: 0.5.h),
        ],
      ),
    );
  }
}
