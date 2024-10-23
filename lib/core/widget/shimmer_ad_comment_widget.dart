import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ListShimmerWidget extends StatelessWidget {
  const ListShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ...List.generate(3, (index) {
          return Padding(
            padding:  EdgeInsets.only(bottom: index<2?2.w:0.w),
            child: Container(
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
            ),
          );
          
        }),
        SizedBox(height: 4.h,),
        Text(LanguageProvider.translate('story','There_are_no_cases_Add_a_story'),
         style: TextStyleClass.normalBoldStyle(color: Theme.of(context).colorScheme.secondaryFixedDim)
        
        )
        ]);
  }
}
