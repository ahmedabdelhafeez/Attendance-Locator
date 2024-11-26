import 'package:attendance_and_departure/features/attendance/presentation/provider/location_provider.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/otp-proivder.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/reset_pass_provider.dart';
import 'package:attendance_and_departure/features/home/presentation/provider/home_provider.dart';
import 'package:attendance_and_departure/features/language/domain/entities/app_localizations.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:attendance_and_departure/features/report/presentation/provider/report_provider.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/pages/splash_page.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/provider/splash_provider.dart';
import 'package:attendance_and_departure/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'config/theme.dart';
import 'core/constants/constants.dart';
import 'core/helper_function/api.dart';
import 'core/helper_function/prefs.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_code_picker/country_code_picker.dart';
// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage event) async {
//   if (event.notification != null) {
//     appNotifications(event.notification!,
//         click: true, fromWhereClicked: 3, payload: event.data);
//   }
// }

// Future<void> localMessagingBackgroundHandler(NotificationResponse pay) async {
//   clickNoti(pay.payload!);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();
  // Platform.isAndroid
  //     ? await Firebase.initializeApp(
  //         options: const FirebaseOptions(
  //             apiKey: 'AIzaSyChdhK1qTNqoSwcwMSXEKcpSI_7AirL1sI',
  //             appId: '1:513756547789:android:e2c9a1a3360af0bb127784',
  //             messagingSenderId: '513756547789',
  //             projectId: 'mazij-f9fd7'))
  //     : await Firebase.initializeApp();
  // await notificationsFirebase();
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // await NotificationLocalClass.init();
  LanguageProvider language = LanguageProvider();
  language.fetchLocale();
  await initializeDependencies();
  await CashMemmory.startSharedPref();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ApiHandle.getInstance.init();
  runApp(MyApp(
    language: language,
  ));
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  final LanguageProvider language;
  MyApp({
    required this.language,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        Constants.isTablet = (deviceType == DeviceType.tablet);
        return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: LanguageProvider()),
              ChangeNotifierProvider(create: (_) => AuthProvider()),
              ChangeNotifierProvider(create: (_) => OtpProvider()),
              ChangeNotifierProvider(create: (_) => HomeProvider()),
              ChangeNotifierProvider(create: (_) => ResetPassProvider()),
              ChangeNotifierProvider(create: (_) => SplashProvider()),
              ChangeNotifierProvider(create: (_) => AttendanceProvider()),
              ChangeNotifierProvider(create: (_) => ReportProvider()),
            ],
            child: ChangeNotifierProvider<LanguageProvider>(
                create: (_) => language,
                child: Consumer<LanguageProvider>(builder: (context, lang, _) {
                  return AnnotatedRegion(
                      value: barColor(),
                      child: MaterialApp(
                          title: 'attendance_and_departure',
                          debugShowCheckedModeBanner: false,
                          navigatorObservers: [routeObserver],
                          navigatorKey: Constants.navState,
                          locale: lang.appLocal,
                          supportedLocales: LanguageProvider.languages,
                          builder: (context, child) {
                            return Theme(
                                data: defaultTheme.copyWith(),
                                child: Container(
                                    color: Colors.white,
                                    child: SafeArea(
                                        top: false, bottom: true, child: SizedBox(width: 100.w, height: 100.h, child: Stack(children: [child!])))));
                          },
                          localizationsDelegates: [
                            CountryLocalizations.delegate,
                            AppLocalizations.delegate,
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate
                          ],
                          home: SplashPage()));
                })));
      },
    );
  }
}
