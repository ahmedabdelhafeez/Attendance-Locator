import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/otp-proivder.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/app_color.dart';
import '../../../../config/text_style.dart';
import '../../../../core/widget/text_field.dart';
import '../../../language/presentation/provider/language_provider.dart';

class OTPWidget extends StatelessWidget {
  const OTPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    OtpProvider otpProvider = Provider.of(context,listen: false);
    return FormField(
      builder: (state) {
        return Column(
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(otpProvider.otp.length, (index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 1.w),
                    child: TextFieldWidget(controller: otpProvider.otp[index],
                    borderRadius:2.w,
                      width: 13.w,
                      height: 7.h,
                      borderColor: const Color(0xffA1A1A1),
                     // cursorColor: Colors.transparent,
                     // elevation: 7,
                      //maxLength: 6,
                      keyboardType: const TextInputType.numberWithOptions(),
                      validator: (val){
                        return null;
                      },
                      focusedBorder: Color.fromARGB(255, 147, 126, 154),
                    
                                       //   autoFocus: index==0,
                      onChange: (val){
                        if(val.length==2){
                          otpProvider.otp[index].text = val[1];
                          if(index!=otpProvider.otp.length-1){
                            FocusScope.of(context).nextFocus();
                          }else{
                            FocusScope.of(context).unfocus();
                          }
                        }else
                        if(val.length==6){
                          for(int u = 0;u<6;u++){
                            otpProvider.otp[u].text = val[u];
                          }
                          FocusScope.of(context).unfocus();
                        }else
                        if(val!=""||val.isNotEmpty){
                          if(index==0){
                            if(index!=otpProvider.otp.length-1){
                              FocusScope.of(context).nextFocus();
                              // FocusScope.of(context).nextFocus();
                            }else{
                              FocusScope.of(context).unfocus();
                            }
                          }else{
                            bool findEmpty = false;
                            for(int i = 0;i<i;i++){
                              if(otpProvider.otp[i].text.isEmpty){
                                for(int o=0;o<(i-i-1);o++){
                                  FocusScope.of(context).previousFocus();
                                  // FocusScope.of(context).previousFocus();
                                }
                                otpProvider.otp[i].clear();
                                otpProvider.otp[i].text = val;
                                findEmpty = true;
                                break;
                              }
                            }
                            if(!findEmpty){
                              if(index!=otpProvider.otp.length-1){
                                FocusScope.of(context).nextFocus();
                                // FocusScope.of(context).nextFocus();
                              }else{
                                FocusScope.of(context).unfocus();
                              }
                            }
                    
                          }
                        }
                        else{
                          if(otpProvider.otp[index].text.isEmpty&&index>0){
                            FocusScope.of(context).previousFocus();
                          }else{
                            otpProvider.otp[index].clear();
                          }
                        }
                      },
                      counter: "",
                    
                      contentPadding: EdgeInsets.symmetric(vertical: 3.h),
                      color: Colors.white,textAlign: TextAlign.center,
                      style: TextStyleClass.headBoldStyle(color: Colors.black), isPassword: false,),
                  );
                  // );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: state.errorText!=null?1.h:0),
              child: Text(
                state.errorText ?? '',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 9.sp,
                ),
              ),
            ),
          ],
        );
      },
      validator: (val){
        bool check = false;
        for(var i in otpProvider.otp){
          if(i.text.isEmpty){
            check = true;
          }
        }
        if(otpProvider.wrong){
          return LanguageProvider.translate("validation", "wrong_code");
        }
        if(check){
          return LanguageProvider.translate("validation", "field");
        }
        return null;
      },
    );
  }
}
