import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/widgets/back_widget.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/widgets/next_button_widget.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/widgets/skip_widget.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/provider/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../config/text_style.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    SplashProvider splashProvider = Provider.of<SplashProvider>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NextButtonWidget(nextPageModel: splashProvider.nextPageModel, width: 90.w),
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Images.backgroundIntroPage), fit: BoxFit.cover)),
        child: Consumer<SplashProvider>(builder: (context, splashProvider, _) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                SkipWidget(),
                SizedBox(height: 2.h),
                Image.asset(splashProvider.intro[splashProvider.index]['image'], width: 90.w, height: 40.h, fit: BoxFit.contain),
                SizedBox(height: 10.h),
                Text(LanguageProvider.translate('intro', splashProvider.intro[splashProvider.index]['title']),
                    style: TextStyleClass.semiBigStyle(color: Colors.white)),
                SizedBox(height: 2.h),
                Text(LanguageProvider.translate('intro', splashProvider.intro[splashProvider.index]['body']),
                    textAlign: TextAlign.right, style: TextStyleClass.semiStyle(color: Colors.white)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
