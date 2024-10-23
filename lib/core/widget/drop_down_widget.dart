import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/core/widget/text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../config/text_style.dart';
import '../constants/constants.dart';
import '../dialog/drop_down_dialog.dart';
import '../models/drop_down_class.dart';
class DropDownWidget extends StatefulWidget {
  final DropDownClass dropDownClass;
  final double? width,borderRadius,height;
  final Color? borderColor,containerColor;
  final void Function()? onTap;
  final EdgeInsets? padding;
  final String? titleText;
  final TextStyle? style;
  final TextStyle? styleDisplayName;
  final String? svg;
  const DropDownWidget({required this.dropDownClass,this.width,this.height,super.key, this.onTap,
    this.borderRadius, this.borderColor,
    this.styleDisplayName,
    this.containerColor,
    this.svg,
     this.padding, this.titleText, this.style});
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState(dropDownClass);
}

class _DropDownWidgetState extends State<DropDownWidget> {
  DropDownClass dropDownClass;
  _DropDownWidgetState(this.dropDownClass);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.titleText!=null)TitleTextFieldWidget(titleText: widget.titleText!, style:widget.style??TextStyleClass.semiStyle()),
        if(widget.titleText!=null)SizedBox(height: 0.5.h,),
        InkWell(
          onTap: (){
            FocusScope.of(context).unfocus();
            if(widget.onTap==null){
              showDropDownDialog(dropDownClass).then((value) => setState((){}));
            }else{
              widget.onTap!();
            }
          },
          child: Container(
            width:widget.width??92.5.w,
            height: widget.height??6.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius??5),
              color:widget.containerColor??Colors.white,
              border: Border.all(color:widget.borderColor?? const Color(0xffE2E2E2)
              ),
            ),
            child: Padding(
              padding: widget.padding??EdgeInsets.symmetric(horizontal: 3.w,
                  vertical: Constants.isTablet?1.h:1.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
 dropDownClass.displayedOptionWidget()??SizedBox.shrink(),
                  SizedBox(width: 2.w,),
                  Text(dropDownClass.displayedName(),
                    style:widget.styleDisplayName??TextStyleClass.normalStyle(color: Color(0xff918E8E))),
                   Spacer(),
            widget.svg == null?Icon(Icons.keyboard_arrow_down_rounded,color: Color(0xff918E8E),):
            SvgWidget(svg: widget.svg!)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
