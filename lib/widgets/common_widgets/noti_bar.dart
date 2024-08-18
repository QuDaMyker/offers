import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:offers/common/constants.dart';

SnackBar notiBar(String message, bool isError, {Duration? duration}) {
  return SnackBar(
      duration: duration ?? const Duration(seconds: 1),
      content: Text(message),
      backgroundColor: isError ? Colors.red : AppColors.primaryColor);
}

Widget loadingWidget({Color? leftDotColor, Color? rightDotColor}) {
  return LoadingAnimationWidget.twistingDots(
    leftDotColor: leftDotColor ?? const Color(0xFF1A1A3F),
    rightDotColor: rightDotColor ?? const Color(0xFFEA3799),
    size: 30,
  );
}
