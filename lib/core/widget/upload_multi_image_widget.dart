import 'dart:io';

import 'package:flutter/material.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_color.dart';
import '../constants/constants.dart';

class UploadMultiImageWidget extends StatelessWidget {
  const UploadMultiImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.w), color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  LanguageProvider.translate('titles', 'upload_for_20_image'),
                  style: TextStyleClass.normalStyle(color: Colors.grey),
                ),
                const Spacer(),
                SvgWidget(
                  svg: Images.awrroBackIcon,
                  color: AppColor.baseColor,
                  width: 3.w,
                )
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            // if(img.isNotEmpty)SizedBox(height: 0.5.h,),
            // if(img.isNotEmpty)
            Container(
              width: 94.w,
              height: 15.w,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      // img.removeAt(i);
                      // setState(() {

                      // });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                      child: Container(
                        width: 15.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                          image: DecorationImage(
                            image: AssetImage(Images.uploadMultyImage),

                            //  FileImage(File(img[i].path)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              LanguageProvider.translate('titles', 'but_on_image_for_edit'),
              style: TextStyleClass.normalStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
