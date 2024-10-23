import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../config/text_style.dart';
import '../../../language/presentation/provider/language_provider.dart';

class CheckEmailWidget extends StatelessWidget {
  const CheckEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            LanguageProvider.translate('check_phone', 'enter_phone'),style: TextStyleClass.semiStyle(
            color: Colors.black,
          ),),
        ],
      ),
    );
  }
}
