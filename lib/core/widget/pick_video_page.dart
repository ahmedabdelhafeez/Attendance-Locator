import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../config/text_style.dart';
import '../constants/constants.dart';
import '../helper_function/convert.dart';
import '../helper_function/helper_function.dart';
import 'button_widget.dart';


bool pickVideoFromCamera = false;
class AddVideoPage extends StatefulWidget {
  const AddVideoPage({super.key});

  @override
  State<AddVideoPage> createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {
  CameraController? _controller;
  int record = 0; // 0 = init 1 = record 2 = stop 3 = finish
  XFile? video;
  bool clicked = false;
  // late int _secondsRemaining;
  int sec = 0;
  late int minute;
  // CountDownController countDownController = CountDownController();
  Timer? _timer;
  void _startRecording() {
    _controller?.startVideoRecording().then((value) {
      // _secondsRemaining = minute*60;
      record = 1;
      setState(() {

      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) async{

        if (sec < minute*60) {
          if(mounted){
            sec++;
            setState(() {

            });
          }else{
            _timer?.cancel();
          }
        } else {
          record = 3;
          // countDownController.pause();
          await delay(100);
          _pause();
        }
      });
    });
  }
  void _send() {
    try{
      _timer?.cancel();
      _controller?.stopVideoRecording().then((file)async {
        await delay(100);
        navPop(file);
      });
    }catch(e){
      print('e');
    }

  }
  void _pause() {
    try{
      _timer?.cancel();
      _controller?.pauseVideoRecording().then((value) {
        setState(() {

        });
      });
    }catch(e){
      print('e');
    }
  }
  void _resume() {
    try{
      _timer?.cancel();
      _controller?.resumeVideoRecording().then((value) {
        record = 1;
        setState(() {

        });
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) async{

          if (sec < minute*60) {
            if(mounted){
              sec++;
              setState(() {

              });
            }else{
              _timer?.cancel();
            }
          } else {
            record = 3;
            // countDownController.pause();
            await delay(100);
            _pause();
          }
        });
      });
    }catch(e){
      print('e');
    }
  }
  void _reset(){
    if(!clicked){
      clicked = true;
      try{
        _timer?.cancel();

        _controller?.stopVideoRecording().then((value) {
          record = 0;
          sec = 0;
          clicked = false;
          setState(() {

          });
        });

      }catch(e){
        print('e');
      }
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();


  }
  Future<void> _toggleCamera() async {

    final cameras = await availableCameras();
    final currentCameraIndex = cameras.indexWhere((c) => c == _controller?.description);
    final nextCameraIndex = (currentCameraIndex + 1) % cameras.length;
    final nextCamera = cameras[nextCameraIndex];
    await _controller?.dispose();
    _controller = CameraController(nextCamera, ResolutionPreset.medium);
    await _controller?.initialize();
    // await _controller?.prepareForVideoRecording();
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    minute = 5;
    availableCameras().then((cameras)async {
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );
      await _controller!.initialize();
      await Future.delayed(const Duration(seconds: 1));
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (val){
        _controller?.dispose();
        // countDownController.pause();
        _timer?.cancel();
      },
      child: Scaffold(
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 100.h,
                child: _controller==null?const SizedBox():CameraPreview(_controller!),
              ),
              Positioned(
                top: 3.h,
                right: 5.w,
                child: Transform.scale(scale: Constants.isTablet?2:1,child: BackButton(color: Colors.white,onPressed: (){
                  _controller?.dispose();
                  // countDownController.pause();
                  _timer?.cancel();
                  navPop();
                },)),
              ),
              Positioned(
                top: 3.h,
                left: 5.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.fiber_manual_record,color: Colors.red,size: 20,),
                      SizedBox(width: 2.w,),
                      Text('$minute:00 / ${convertSecToMin(sec)}',style: TextStyleClass.normalStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
                  child: Center(
                    child: Row(
                      children: [
                        if(record==0)InkWell(
                          onTap: (){
                            _toggleCamera();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(Icons.camera_enhance_sharp,color: Colors.white,size: Constants.isTablet?40:20,),
                              // SizedBox(height: 1.h,),
                              Text(LanguageProvider.translate('ad', 'change_camera'),style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp
                              ),)
                            ],
                          ),
                        ),
                        SizedBox(width: 3.w,),
                        if([1,2,3].contains(record))ButtonWidget(onTap: (){
                          _send();
                        }, text: 'send',width: 20.w,height: 4.5.h,color: Colors.white,
                            textStyle: TextStyleClass.smallStyle(),),
                        const Spacer(),
                        if([0,2].contains(record))InkWell(onTap: (){
                          if(record==0){
                            _startRecording();
                          }else{
                            _resume();
                          }
                        },child: const Icon(Icons.play_circle,color: Colors.white,size: 40,)),
                        if([1].contains(record))InkWell(onTap: (){
                          record = 2;
                          _pause();

                        },child: const Icon(Icons.pause_circle,color: Colors.white,size: 40,)),
                        if([2,3,1].contains(record))InkWell(onTap: (){
                          _reset();
                        },child: const Icon(Icons.stop_circle_rounded,color: Colors.white,size: 40,)),



                        // GestureDetector(
                        //   onTap: ()async{
                        //     if(record==2&&video!=null){
                        //       _controller?.dispose();
                        //       countDownController.pause();
                        //       _timer?.cancel();
                        //       navPop(video);
                        //     }
                        //   },
                        //   onLongPressStart: (val){
                        //     countDownController.reset();
                        //     countDownController.start();
                        //     record = 1;
                        //     _startRecording();
                        //   },
                        //   onLongPressEnd: (va)async{
                        //     record = 2;
                        //     await delay(100);
                        //     countDownController.pause();
                        //     if(_secondsRemaining>2){
                        //       _pause(2);
                        //     }
                        //   },
                        //   child: CircularCountDownTimer(
                        //     duration: minute*60,
                        //     initialDuration: 0,
                        //     controller: countDownController,
                        //     width: 21.w,
                        //     height: 21.w,
                        //     ringColor: AppColor.defaultColor.withOpacity(0.2),
                        //     ringGradient: null,
                        //     fillColor: AppColor.defaultColor.withOpacity(0.5),
                        //     fillGradient: null,
                        //     backgroundColor: AppColor.defaultColor,
                        //     backgroundGradient: null,
                        //     strokeWidth: 8.0,
                        //     strokeCap: StrokeCap.round,
                        //     textStyle: TextStyle(
                        //         fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        //     textFormat: CountdownTextFormat.S,
                        //     isReverse: true,
                        //     isReverseAnimation: true,
                        //     isTimerTextShown: true,
                        //     autoStart: false,
                        //     onStart: () {
                        //       debugPrint('Countdown Started');
                        //     },
                        //     onComplete: () {
                        //       debugPrint('Countdown Ended');
                        //     },
                        //     onChange: (String timeStamp) {
                        //       debugPrint('Countdown Changed $timeStamp');
                        //     },
                        //     timeFormatterFunction: (defaultFormatterFunction, duration) {
                        //       if(record == 2 ){
                        //         return "Save";
                        //       }else
                        //       if (record == 0) {
                        //         return "Start";
                        //       } else {
                        //         return convertSecToMin(int.parse(Function.apply(defaultFormatterFunction, [duration]).toString()));
                        //       }
                        //     },
                        //   ),
                        // ),
                        // Spacer(),
                        // SizedBox(width: 20.w,),
                        // if([0,2,].contains(record))SizedBox(width: 20.w,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
