import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants/images.dart';

class RecorderWidget extends StatefulWidget {
  const RecorderWidget({super.key});

  @override
  State<RecorderWidget> createState() => _RecorderWidgetState();
}

class _RecorderWidgetState extends State<RecorderWidget> {
  double height = 5.h;
  double width = 15.w;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(alignment: Alignment.bottomRight, child: CustomInkWell()),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 10.h,
                width: 100.w,
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  child: Row(
                    children: [
                      Draggable(
                        childWhenDragging: CustomInkWell(),
                        feedback: SizedBox(
                          height: 10.h,
                          width: 30.w,
                        ),
                        child: Container(
                          height: 5.h,
                          width: 15.w,
                          alignment: Alignment.bottomRight,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('Images.logo'))),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  InkWell CustomInkWell() {
    return InkWell(
      onTapUp: (details) {
        height * 2;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: Durations.long1,
        height: height,
        width: 30.w,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('Images.logo'))),
      ),
    );
  }
}
