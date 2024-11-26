import 'dart:io';

import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/helper_function/loading.dart';
import 'package:attendance_and_departure/core/helper_function/navigation.dart';
import 'package:attendance_and_departure/core/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/splash_screen/presentation/provider/splash_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/helper_function/helper_function.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool? internetConnection;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        _showNoInternetDialog();
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await delay(600);

          Provider.of<SplashProvider>(context, listen: false).startApp();
        });
      }
    } on SocketException catch (_) {
      _showNoInternetDialog();
    }
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
          title: Text(
            'لا يوجد اتصال بالإنترنت',
            style: TextStyleClass.headBoldStyle(color: Colors.black),
          ),
          content: Text(
            " يرجي الانصال بالانترنت واعادة المحاولة",
            style: TextStyleClass.normalBoldStyle(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the app
                navP(SplashPage());
              },
              child: Text(
                'حسنا',
                style: TextStyleClass.smallBoldStyle(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();

    //  SafeArea(
    //     bottom: false,
    //     top: false,
    //     child: Scaffold(
    //       body: Container(
    //         width: 100.w,
    //         height: 100.h,
    //         decoration: BoxDecoration(
    //           image: DecorationImage(image:AssetImage(Images.logo),fit: BoxFit.cover)
    //         ),
    //       ),
    //     ));
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller
    _controller = VideoPlayerController.asset(Images.animationLogo);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Play video automatically
      _controller.play();
    });

    // Go to the home screen after the video is done playing
    // _controller.addListener(() {
    //   if (_controller.value.position == _controller.value.duration) {
    //     Navigator.of(context).pushReplacementNamed('/home');
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          return Center(
            child: Image.asset(Images.eslam),
          );
        },
      ),
    );
  }
}
