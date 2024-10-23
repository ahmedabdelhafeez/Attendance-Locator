import 'package:flutter/material.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:sizer/sizer.dart';

import '../../config/text_style.dart';


class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, this.onRate,this.read = false, this.rate = 5, this.showText = true, this.iconSize});
  final void Function(double rate)? onRate;
  final bool read,showText;
  final double rate;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: SimpleStarRating(
            allowHalfRating: true,
            starCount: 5,
            rating: rate,
            size: iconSize??11,
            isReadOnly: read,
            onRated: (rate) {
              if(onRate!=null){
                onRate!(rate??0);
              }
            },
            spacing: 2,
          ),
        ),
        if(showText)SizedBox(width: 1.w,),
        if(showText)Text('$rate',style: TextStyleClass.normalStyle(color: Colors.grey),),
      ],
    );
  }
}
