import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HelloTitleWidget extends StatelessWidget {
  const HelloTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Container(
                        width: 100.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                LanguageProvider.translate('login', "hi"),
                                style: TextStyleClass.headBoldStyle(color: Colors.black),
                              ),
                               Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                LanguageProvider.translate('login', "welcome"),
                                style: TextStyleClass.normalStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
  }
}