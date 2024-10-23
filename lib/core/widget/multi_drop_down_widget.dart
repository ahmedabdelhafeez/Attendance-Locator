import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/dialog/multi_drop_down_dialog.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../config/text_style.dart';
import '../models/multi_drop_down_class.dart';


class MultiDropDownWidget extends StatefulWidget {
  final MultiDropDownClass dropDownClass;
  final double? width;
  final String title;
  const MultiDropDownWidget({required this.dropDownClass,this.width,Key? key, required this.title}) : super(key: key);
  @override
  State<MultiDropDownWidget> createState() => _MultiDropDownWidgetState(dropDownClass);
}

class _MultiDropDownWidgetState extends State<MultiDropDownWidget> {
  MultiDropDownClass dropDownClass;
  _MultiDropDownWidgetState(this.dropDownClass);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            FocusScope.of(context).unfocus();
            showMultiDropDownDialog(dropDownClass,widget.title).then((value) => setState((){}));
          },
          child: Container(
            width:92.5.w,
            height: 6.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
                  border: Border.all(color: const Color(0xffE2E2E2),),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.7.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  dropDownClass.displayedWidget()??SizedBox(),
                  if(dropDownClass.displayedWidget()!=null)SizedBox(width: 2.w,),
                  Text(dropDownClass.displayedName(),
                    style: TextStyleClass.normalStyle(color: Theme.of(context).colorScheme.secondaryFixedDim),),
                  Spacer(),
                 // const SvgWidget(svg: Images.downarow,color: Color(0xffB8B8B8),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
