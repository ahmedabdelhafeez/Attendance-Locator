import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:attendance_and_departure/core/constants/images.dart';
import 'package:attendance_and_departure/core/widget/shimmer_text_widget.dart';
import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class HeaderWidegt extends StatelessWidget {
  HeaderWidegt({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Container(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ZoomTapAnimation(
                   onTap: onTap,
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                          child: ShimmerTextWidget(
                            enabled: false,
                            shimmerDirection: ShimmerDirection.ltr,
                            gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
                            child: Image.asset(
                              Images.personn,
                              width: 7.w,
                            ),
                          )),
                      SizedBox(width: 3.w),
                      ShimmerTextWidget(
                          gradient: LinearGradient(colors: [Colors.black, Colors.orange]),
                          child: Text(
                            Provider.of<AuthProvider>(Constants.globalContext(), listen: false).userName ?? "مرحبا بك في عملك",
                            style: TextStyleClass.headBoldStyle(shadow: [
                              Shadow(
                                offset: Offset(4.0, 4.0), // Position of the shadow
                                blurRadius: 6.0, // How much the shadow is blurred
                                color: Colors.grey.withOpacity(0.4), // Shadow color
                              ),
                            ], color: Colors.black),
                          ),
                          shimmerDirection: ShimmerDirection.ttb,
                          enabled: false),
                      ShimmerTextWidget(
                          gradient: LinearGradient(colors: [Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.5)]),
                          child: Text(
                            Provider.of<AuthProvider>(Constants.globalContext(), listen: false).dayTime,
                            style: TextStyleClass.semiBoldStyle(shadow: [
                              Shadow(
                                offset: Offset(4.0, 4.0), // Position of the shadow
                                blurRadius: 6.0, // How much the shadow is blurred
                                color: Colors.grey.withOpacity(0.4), // Shadow color
                              ),
                            ], color: const Color.fromARGB(255, 134, 133, 133)),
                          ),
                          shimmerDirection: ShimmerDirection.ttb,
                          enabled: false),
                    ],
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 10.w,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(Images.eslamLogo),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ZoomTapAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const ZoomTapAnimation({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  _ZoomTapAnimationState createState() => _ZoomTapAnimationState();
}

class _ZoomTapAnimationState extends State<ZoomTapAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _zoomAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    _zoomAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTap!();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _zoomAnimation,
        child: widget.child,
      ),
    );
  }
}
