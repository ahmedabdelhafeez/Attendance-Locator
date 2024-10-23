import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTextWidget extends StatelessWidget {
  const ShimmerTextWidget({super.key, required this.gradient, required this.child, required this.shimmerDirection, required this.enabled});
  final Gradient gradient;
  final Widget child;
  final ShimmerDirection shimmerDirection;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: child,
      direction: shimmerDirection,
      enabled: enabled,
      gradient: gradient,
    );
  }
}
