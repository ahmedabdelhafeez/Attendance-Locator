import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/core/widget/shimmer_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/otp-proivder.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../../../config/text_style.dart';
import '../../../language/presentation/provider/language_provider.dart';

class ResendWidget extends StatelessWidget {
  const ResendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    OtpProvider otpProvider = Provider.of(context, listen: true);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(TextSpan(text: LanguageProvider.translate("otp", "did_not_receive"), style: TextStyleClass.semiStyle(color: Colors.grey))),
              SizedBox(
                width: 2.w,
              ),
              Text(
                '00:${otpProvider.counter.toString().padLeft(2, "0")}',
                style: TextStyleClass.semiStyle(),
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          InkWell(
            onTap: () {
              if (otpProvider.counter == 0) {
                //  otpProvider.reSend();
              }
            },
            child: Text(
              " ${LanguageProvider.translate("otp", "resend")}",
              style: TextStyleClass.normalBoldStyle(color:AppColor.baseColor),
            ),
          )
        ],
      ),
    );
  }
}
