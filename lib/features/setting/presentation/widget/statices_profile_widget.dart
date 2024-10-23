import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:attendance_and_departure/features/setting/presentation/widget/section_statics_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
class StaticesProfileWidget extends StatelessWidget {
  const StaticesProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Material(
          elevation: 2.w,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(10.w), topStart: Radius.circular(2.w), bottomEnd: Radius.circular(2.w), bottomStart: Radius.circular(2.w))),
          child: Container(
            height: 15.h,
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(10.w),
                    topStart: Radius.circular(2.w),
                    bottomEnd: Radius.circular(2.w),
                    bottomStart: Radius.circular(2.w))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.antiAlias,
                  children: <Widget>[
          //           if (auth.userEntity?.logo != null)
          //             CircleAvatar(radius: 10.w, backgroundImage: CachedNetworkImageProvider(auth.userEntity!.logo))
          //           else
          //             InkWell(
          //                onTap: () {
          //  //     Provider.of<UserProfileProvider>(context, listen: false).goToUserPage();
          //     },
          //               child: CircleAvatar(radius: 10.w, backgroundImage: AssetImage(Images.profileImageAccount))),
                    Positioned(
                        top: 5.5.h,
                        child: Material(
                          elevation: 1.w,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.w)),
                          child: Container(
                            padding: EdgeInsets.all(1.5.w),
                            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            child: SvgWidget(svg: Images.protectedIcon),
                          ),
                        ))
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(auth.userEntity?.name ?? 'محمد احمد معتز', style: TextStyleClass.normalStyle(color: Colors.black)),
                       SizedBox(height: 1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgWidget(svg: Images.documentedIcon),
                            SizedBox(width: 2.w,),
                            Text(auth.userEntity?.name ?? 'محمد احمد معتز', style: TextStyleClass.normalStyle(color: Colors.black)),
                          ],
                        ),
  SizedBox(height: 1.h,),
                        SectionStaticsProfileWidget()
                      ],
                    ),
                  ),
                ),
           
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  SvgWidget(svg: Images.editadsIcon),
                  SizedBox(height: 1.h,),
                  SvgWidget(svg: Images.logoutProfilecon)
                ],),
                SizedBox(width: 2.w,)
              ],
            ),
          )),
    );
  }
}
