import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CenteredLoadingAnimation extends StatelessWidget {
  const CenteredLoadingAnimation({
    super.key,
    required this.animationPath,
    this.height,
    this.width,
  });
  final String animationPath;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Lottie.asset(
          animationPath,
          fit: BoxFit.cover,
          height: height ?? 100.h,
          width: width ?? 100.w,
        ),
      ),
    );
  }
}
