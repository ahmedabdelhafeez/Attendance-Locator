import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import '../../../../config/app_color.dart';
import '../../../../config/text_style.dart';
import '../../../language/presentation/provider/language_provider.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text(
          '${LanguageProvider.translate('register', 'have_account')} ',
          style: TextStyleClass.normalStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        InkWell(
          onTap: () {
            Provider.of<AuthProvider>(context, listen: false).goToLoginPage();
          },
          child: Text(
            '${LanguageProvider.translate('register', 'login')} ',
            style: TextStyleClass.normalStyle(color: AppColor.secColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
