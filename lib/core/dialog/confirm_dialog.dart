

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import '../constants/constants.dart';

void confirmDialog(String title,String confirm,void Function() confirmTap,
    {String? cancel,void Function()? cancelTap}){
      cancel!=null?
        showCupertinoModalPopup<void>(
    context: Constants.globalContext(),
    barrierDismissible: false,
    builder: (BuildContext context) => Transform.scale(
      scale: Constants.isTablet?2:1,
      child: CupertinoAlertDialog(
        title: Text(title,style: const TextStyle(color: Colors.black),),
        actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
            onPressed: cancelTap??() {
              Navigator.pop(context);
            },
            child: Text(cancel??LanguageProvider.translate('buttons', 'cancel')
              ,style: const TextStyle(color: Colors.black),),
          ),
          CupertinoDialogAction(
            onPressed: confirmTap,
            child: Text(confirm,style: const TextStyle(color: Colors.red),),
          ),
          
        ],
      ),
    ),
  ):
  showCupertinoModalPopup<void>(
    context: Constants.globalContext(),
    barrierDismissible: false,
    builder: (BuildContext context) => Transform.scale(
      scale: Constants.isTablet?2:1,
      child: CupertinoAlertDialog(
        title: Text(title,style: const TextStyle(color: Colors.black),),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: confirmTap,
            child: Text(confirm,style: const TextStyle(color: Colors.red),),
          ),
        ],
      ),
    ),
  );
}