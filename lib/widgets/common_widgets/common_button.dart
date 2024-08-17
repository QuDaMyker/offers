import 'package:flutter/material.dart';
import 'package:offers/common/constants.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.title,
    required this.onTap,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.height,
    this.left,
  });
  final String title;
  final Function() onTap;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final Widget? left;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      margin: margin ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          splashColor: Colors.black.withOpacity(0.3),
          onTap: onTap,
          child: Container(
            padding: padding ?? const EdgeInsets.all(0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (left != null) ...[
                    left!,
                    const SizedBox(
                      width: 8,
                    )
                  ],
                  Text(
                    title,
                    style: textStyle ??
                        const TextStyle(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
