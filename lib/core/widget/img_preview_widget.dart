
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ImagePreviewWidget extends StatelessWidget {
  final XFile? img;
  final String? imgPath;
  const ImagePreviewWidget({this.img,this.imgPath,super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: img==null?null:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ButtonWidget(onTap: (){
            //   navPop();
            //   Provider.of<MessageProvider>(context,listen: false).addMessage(image: img!);
            // }, text: 'send'),
            SizedBox(height: 1.h,),
          ],
        ),
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const SizedBox(),
        ),
        body: Container(
          width: 100.w,
          height: 95.h,
          decoration: BoxDecoration(
            image: img==null?DecorationImage(
              image: CachedNetworkImageProvider(imgPath!),
              fit: BoxFit.contain,
            ):DecorationImage(
              image: FileImage(File(img!.path)),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
