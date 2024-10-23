import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_color.dart';
import '../../config/text_style.dart';
import '../../features/language/presentation/provider/language_provider.dart';
import '../constants/images.dart';
import '../helper_function/image.dart';


class UploadSingleImageWidget extends StatelessWidget {
  const UploadSingleImageWidget({Key? key,required this.image, required this.selectImage}) : super(key: key);
  final XFile? image;
  final void Function(XFile? image) selectImage;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: ()async{
          FocusScope.of(context).unfocus();
          XFile? image = await chooseImage();
          selectImage(image);
        },
        child: Container(
          width: 90.w,
          height: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(3.w),
          child: Column(
            children: [
              Row(
                children: [
                  Text(LanguageProvider.translate('global', 'add_image'),
                    style: TextStyleClass.semiStyle(color: AppColor.defaultColor),)
                ],
              ),
              SizedBox(height: 3.h,),
              Container(
                width: 45.w,
                height: 35.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  image: image==null?null:DecorationImage(
                    image: FileImage(File(image!.path),),
                    fit: BoxFit.cover,
                  ),
                ),
                child: image==null?Center(
                  child: SvgWidget(svg: Images.uploadImageIcon,color: AppColor.defaultColor,),
                ):SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
