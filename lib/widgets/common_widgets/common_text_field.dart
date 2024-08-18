import 'package:flutter/material.dart';
import 'package:offers/common/constants.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    this.hint,
    required this.controller,
    this.prefixIcon,
    this.enable,
    this.textInputType,
    this.suffixText,
    this.validator,
    this.onChanged,
  });
  final bool? enable;
  final String? hint;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? textInputType;
  final String? suffixText;
  final String Function(String?)? validator;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.done,
        keyboardType: textInputType ?? TextInputType.text,
        validator: validator ??
            (value) =>
                value == null || value.isEmpty ? 'Please fill value' : null,
        onChanged: onChanged,
        textAlign: TextAlign.end,
        enabled: enable,
        maxLines: 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.primaryColor,
        style: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          errorMaxLines: 3,
          hintText: hint ?? '',
          isDense: false,
          hintStyle: TextStyle(
            color: AppColors.textColor.withOpacity(0.5),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.textColor),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: UnderlineInputBorder(
            // borderSide: BorderSide(width: 1, color: AppColors.textColor),
            borderSide: BorderSide(width: 1, color: AppColors.textColor),
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(prefixIcon),
                )
              : null,
          suffixText: suffixText,
        ),
      ),
    );
  }
}
