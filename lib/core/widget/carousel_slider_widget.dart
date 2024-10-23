import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key, required this.image,this.activeColor,this.deactiveColor, this.elevation});
 final String image;
 final Color? activeColor ;
 final Color? deactiveColor;
 final double? elevation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     CarouselSlider(
              options: CarouselOptions(
                  height: 20.h,
                  autoPlayInterval: const Duration(seconds: 10),
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  ),
              items:
                  List.generate(3, (i) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                         Padding(
                           padding:  EdgeInsets.symmetric(horizontal:4.w),
                           child: Material(
                            elevation: elevation??0.w,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
                             child: Container(
                                       height: 17.h,
                                       clipBehavior: Clip.antiAlias,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(2.w),
                                         image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                                       ),
                                     ),
                           ),
                         ),
                    ],
                  ),
                );
              }),
            ),
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (i) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                      child: i == i
                          ? Container(
                              height: 2.w, width: 2.w, decoration: BoxDecoration(color:activeColor??Colors.white, borderRadius: BorderRadius.circular(2.w)))
                          : Container(
                              height: 3.w,
                              width: 3.w,
                              decoration: BoxDecoration(
                                  color:deactiveColor?? Colors.grey.shade200,
                                  border: Border.all(color: Colors.grey.shade200, width: 2.0),
                                  borderRadius: BorderRadius.circular(2.w)))))),
        ),
      ],
    );
  }
}