import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

SnackBar notiBar(String message, bool isError) {
  return SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.black);
}

Widget loadingWidget({Color? leftDotColor, Color? rightDotColor}) {
  return LoadingAnimationWidget.twistingDots(
    leftDotColor: leftDotColor ?? const Color(0xFF1A1A3F),
    rightDotColor: rightDotColor ?? const Color(0xFFEA3799),
    size: 30,
  );
}
