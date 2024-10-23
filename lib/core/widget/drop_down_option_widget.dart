
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/core/widget/radio_widget.dart';
import 'package:sizer/sizer.dart';

import '../../config/text_style.dart';
import '../constants/constants.dart';
import '../models/drop_down_class.dart';
class DropDownOptionWidget extends StatefulWidget {
  final DropDownClass dropDownClass;
  final dynamic data;
  final dynamic selected;
  final void Function() rebuild;
  const DropDownOptionWidget({required this.dropDownClass,
    super.key, required this.data, required this.rebuild, this.selected});
  @override
  State<DropDownOptionWidget> createState() => _DropDownOptionWidgetState(dropDownClass,data);
}

class _DropDownOptionWidgetState extends State<DropDownOptionWidget> {
  _DropDownOptionWidgetState(this.dropDownClass,this.data);
  DropDownClass dropDownClass;
  dynamic data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.1.h),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey,
        child: InkWell(
          onTap: ()async {
            // await dropDownClass.onTap(data);
            widget.rebuild();
            setState(() {

            });
          },
          child: Container(
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Constants.isTablet?2.h:0.1.h),
              child: ListTile(
                leading: InkWell(onTap: (){
                    widget.rebuild();
                    setState(() {

                    });
                },child: RadioWidget(selected: data == widget.selected,)),
                horizontalTitleGap: 2.w,
                visualDensity: VisualDensity.compact,
                title: Text(dropDownClass.displayedOptionName(data),style: TextStyleClass.semiStyle(),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
