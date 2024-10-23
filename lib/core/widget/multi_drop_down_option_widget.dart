import 'package:attendance_and_departure/core/widget/checkbox_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../config/text_style.dart';
import '../constants/constants.dart';
import '../models/multi_drop_down_class.dart';
class MultiDropDownOptionWidget extends StatefulWidget {
  final MultiDropDownClass dropDownClass;
  final void Function(dynamic val) rebuild;
  final dynamic data;
  final bool check;
  const MultiDropDownOptionWidget({required this.dropDownClass,
    Key? key, required this.data, required this.rebuild, required this.check,}) : super(key: key);
  @override
  State<MultiDropDownOptionWidget> createState() => _MultiDropDownOptionWidgetState(dropDownClass,data);
}

class _MultiDropDownOptionWidgetState extends State<MultiDropDownOptionWidget> {
  _MultiDropDownOptionWidgetState(this.dropDownClass,this.data);
  MultiDropDownClass dropDownClass;
  dynamic data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.1.h),
      child: InkWell(
        onTap: ()async {
          // await dropDownClass.onTap(data);
          widget.rebuild(data);
          setState(() {

          });
        },
        child: Container(
          width: 90.w,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(16),
          //   color: Colors.white,
          // ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Constants.isTablet?2.h:0.1.h),
            child: ListTile(
              trailing: CheckBoxWidget(check: widget.check, onChange: (val){
                widget.rebuild(data);
                setState(() {

                });
              }),
              horizontalTitleGap: 2.w,
              visualDensity: VisualDensity.compact,
              title: Row(
                children: [
                  dropDownClass.displayedOptionWidget(data)??SizedBox(),
                  if(dropDownClass.displayedOptionWidget(data)!=null)SizedBox(width: 2.w,),
                  Expanded(child: Text(dropDownClass.displayedOptionName(data),style: TextStyleClass.semiStyle(),)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
