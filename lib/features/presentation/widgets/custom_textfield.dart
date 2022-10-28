/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final double? borderWigdth;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.borderWigdth,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.readOnly = false,
    this.maxLength,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    return SizedBox(
      width: 1.sw,
      height: 42.h,
      child: TextField(
        maxLength: maxLength,
        maxLines: maxLines,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        cursorColor: ThemeHelper.black,
        keyboardType: keyboardType,
        style: TextHelper.sf13normal,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: suffixIcon == null ? 13.w : 0,
            vertical: 1.h,
          ),
          hintText: hintText,
          hintStyle: TextHelper.sf13normal.copyWith(color: ThemeHelper.grey),
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 30.w,
            minHeight: 100.h,
          ),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeHelper.black,
              width: borderWigdth ?? 1.0.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeHelper.black,
              width: borderWigdth ?? 1.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
