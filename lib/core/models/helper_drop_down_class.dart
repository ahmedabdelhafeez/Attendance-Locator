
import 'package:flutter/src/widgets/framework.dart';

import 'drop_down_class.dart';

class HelperDropDownClass implements DropDownClass{
  List<String> data;
  String? selectedData;
  Widget? widget;
  String placeHolder;
  HelperDropDownClass({required this.data,required this.placeHolder});


  @override
  String displayedName() {
    return selectedData??placeHolder;
  }

  @override
  String displayedOptionName(type) {
    return type as String;
  }

  @override
  List list() {
    return data;
  }

  @override
  Future onTap(data) async{
    if(selectedData==data){
      selectedData = null;
    }else{
      selectedData = data;
    }

  }

  @override
  String? selected() {
    return selectedData;
  }
  @override
  dynamic value(){
    return null;
  }

  @override
  Widget displayedOptionWidget() {
    // TODO: implement displayedOptionWidget
    throw UnimplementedError();
  }
}