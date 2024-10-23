

import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/helper_function/helper_function.dart';
import 'package:attendance_and_departure/core/widget/multi_drop_down_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants/constants.dart';
import '../helper_function/navigation.dart';
import '../models/drop_down_class.dart';
import '../models/multi_drop_down_class.dart';
import '../widget/button_widget.dart';
import '../widget/drop_down_option_widget.dart';

Future showMultiDropDownDialog(MultiDropDownClass dropDownClass,String title)async{
  List<dynamic> selected = dropDownClass.selected();
  // FocusScope.of(Constants.globalContext()).unfocus();
  return await showModalBottomSheet(
    context: Constants.globalContext(),
    backgroundColor:Colors.white,
    isDismissible: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight:  Radius.circular(25),
      ),
    ),
    builder: (context) {

      return GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: 100.w,
          constraints: BoxConstraints(
            maxHeight: 45.h,
            minHeight: 45.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight:  Radius.circular(25),
            ),
          ),
          child: StatefulBuilder(
            builder: (context,setState) {
              print('hamza');
              print(selected.isEmpty);
              print(selected.contains('a'));
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 2.h,),
                          Text(title,style: TextStyleClass.headStyle(color: AppColor.defaultColor),),
                          SizedBox(height: 3.h,),
                          ...List.generate(dropDownClass.list().length, (index) {
                            dynamic data = dropDownClass.list()[index];
                            return MultiDropDownOptionWidget(dropDownClass: dropDownClass, data: data,

                            rebuild: (val){
                              if(selected.contains(val)){
                                selected.remove(val);
                              }else{
                                selected.add(val);
                              }
                              print(selected);
                              setState((){});
                            }, check: selected.contains(data),);
                          }),
                          SizedBox(height: 4.h,),

                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 5.w,
                    right: 5.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonWidget(onTap: ()async{
                          await dropDownClass.onTap(selected);
                          print(dropDownClass.displayedName());
                          await delay(100);
                          navPop(dropDownClass);
                        }, text: 'save'),
                      ],
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      );
    },
    isScrollControlled: true,
  ).then((value) {
    FocusScope.of(Constants.globalContext()).unfocus();
  });
}