import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

showAnimatedSnackBar({
  required String message,
  required BuildContext context,
  required AnimatedSnackBarType type,
  Duration duration = const Duration(seconds: 2),
}) {
  AnimatedSnackBar.material(
    message,
    type: type,
    duration: duration,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
  ).show(context);
}
