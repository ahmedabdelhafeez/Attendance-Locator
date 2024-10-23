import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 100.w,
              height: 10.h,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2.w)),
              ),
              child: Shimmer.fromColors(
                baseColor: Color(0xff00249C),
                highlightColor: Color(0xff8C0F96),
                child: Container(
                  width: 100.w,
                  height: 30.w,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Color.fromARGB(255, 75, 46, 46)),
                ),
              ),
            );
  }
}