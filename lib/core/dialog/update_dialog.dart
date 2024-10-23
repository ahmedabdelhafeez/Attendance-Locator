

import 'package:flutter/cupertino.dart';
import 'package:attendance_and_departure/config/app_color.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
//import 'package:store_redirect/store_redirect.dart';
import '../helper_function/navigation.dart';


Future updateDialog(bool mustLogin)async{
  await showCupertinoModalPopup<void>(
    context: Constants.globalContext(),
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(LanguageProvider.translate('global', 'new_update'),style: const TextStyle(),),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          onPressed: ()async{
            // StoreRedirect.redirect(androidAppId: "com.user.fans_food",
            //     iOSAppId: "6499508192");
          },
          child: Text(LanguageProvider.translate('buttons', 'update'),
            style: const TextStyle(color: AppColor.defaultColor),),
        ),
        if(!mustLogin)CupertinoDialogAction(
          onPressed: ()async{
            navPop();
          },
          child: Text(LanguageProvider.translate('buttons', 'cancel'),style: const TextStyle(),),
        ),

      ],
    ),
  );
}