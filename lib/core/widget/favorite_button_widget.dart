import 'package:flutter/material.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:untitled/features/auth/presentation/provider/auth_provider.dart';
// import 'package:untitled/features/market/domain/usecases/market_usecases.dart';
// import 'package:untitled/injection_container.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';
import '../models/favorite_class.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final Favorite favorite;
  final Color? color;
  final double? padding, size, margin;
  const FavoriteButtonWidget(
      {required this.favorite,
      super.key,
      this.color,
      this.padding,
      this.size,
      this.margin});

  @override
  State<FavoriteButtonWidget> createState() =>
      _FavoriteButtonWidgetState(favorite);
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  Favorite favorite;
  _FavoriteButtonWidgetState(this.favorite);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
         // AuthProvider auth = Provider.of(context, listen: false);

          // if (!auth.isGuest()) {
          //   Map<String, dynamic> data = {
          //     "id": favorite.id,
          //     "type": favorite.type()
          //   };
          //   // if (favorite.isFavorite) {
          //   //   MarketUseCases(sl()).removeFavorite(data);
          //   // } else {
          //   //   MarketUseCases(sl()).addFavorite(data);
          //   // }
          //   favorite.isFavorite = !favorite.isFavorite;
          //   setState(() {});
          // } else {
          //   showGuestDialog();
          // }
        },
        child: Container(
            height: 12.w,
            width: 12.w,
            margin: widget.margin != null
                ? EdgeInsets.only(bottom: 2.h)
                : EdgeInsets.only(bottom: 2.h),
            child: Column(children: [
              Icon(
                  favorite.type() == "video"
                      ? FontAwesomeIcons.solidHeart
                      : favorite.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                  color: favorite.isFavorite
                      ? Colors.red
                      : favorite.type() == "comment"
                          ? null
                          : Colors.white,
                  size: widget.size ?? (Constants.isTablet ? 24 : 19)),
              SizedBox(height: 1.h),
              Text(favorite.count().toString(),
                  style: TextStyleClass.normalBoldStyle(
                      color: favorite.type() == "comment"
                          ? Colors.grey
                          : Colors.white))
            ])));

    /* Row(
      children: [
        Column(
          children: [
            InkWell(
              onTap: ()async{
                AuthenticationProvider auth = Provider.of(context,listen: false);
                if(!auth.isGuest){
                  if(favorite.isFavorite){
                    await favorite.removeFavorite();
                  }else{
                    await  favorite.addFavorite();
                  }
                  setState(() {
                
                  });
                }else{
                  showGuestDialog();
                }
              },
              child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(widget.padding??(Constants.isTablet?1.3.w:1.4.w)),
                  child: Icon(Icons.favorite,color: favorite.isFavorite?Colors.red
                      :Colors.white,size: widget.size??(Constants.isTablet?20:15),),
                ),
              ),
            ),
          ],
        ),
      ],
    ); */
  }
}
