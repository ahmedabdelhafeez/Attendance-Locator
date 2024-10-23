import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/text_style.dart';

class ValidationWidget extends StatelessWidget {
  const ValidationWidget({super.key, required this.conditions});
  final List<Map> conditions;
  @override
  Widget build(BuildContext context) {
    return FormField(builder: (state){
      return Column(children: [
        if(state.hasError)SizedBox(height: 0.5.h,),
        if(state.hasError)Text(state.errorText!,style: TextStyleClass.normalStyle(color: Colors.red),)
      ],);
    },validator: (val){

      for(var i in conditions){
        if(i['value']){
          return i['text'];
        }
      }
      return null;
    },);
  }
}
