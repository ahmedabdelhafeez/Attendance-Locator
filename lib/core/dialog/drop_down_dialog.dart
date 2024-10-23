

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';
import '../helper_function/navigation.dart';
import '../models/drop_down_class.dart';
import '../widget/button_widget.dart';
import '../widget/drop_down_option_widget.dart';

Future showDropDownDialog(DropDownClass dropDownClass)async{
  dynamic selected = dropDownClass.selected();
  FocusScope.of(Constants.globalContext()).unfocus();
  await showModalBottomSheet(
    context: Constants.globalContext(),
    backgroundColor:Colors.white.withOpacity(0.8),
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
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight:  Radius.circular(25),
            ),
          ),
          child: StatefulBuilder(
            builder: (context,setState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 3.h,),
                      ...List.generate(dropDownClass.list().length, (index) {
                        dynamic data = dropDownClass.list()[index];
                        return DropDownOptionWidget(dropDownClass: dropDownClass, data: data,
                        selected: selected,
                        rebuild: (){
                          if(data == selected){
                            selected = null;
                          }else{
                            selected = data;
                          }
                          setState((){});
                        },);
                      }),
                      SizedBox(height: 1.h,),
                      ButtonWidget(
                        isGredient: true,
                        onTap: ()async{
                        
                        navPop();
                        await dropDownClass.onTap(selected);
                      print(dropDownClass.value());
                      }, text: 'save'),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      );
    },
    isScrollControlled: true,
  );
}