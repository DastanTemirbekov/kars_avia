/* External dependencies */
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';

class Exceptions {
  static showFlushbar(
    String message, {
    required BuildContext context,
    FlushbarPosition flushbarPosition = FlushbarPosition.BOTTOM,
  }) {
    Flushbar(
      backgroundColor:  ThemeHelper.black,
      borderRadius: BorderRadius.circular(10.r),
      margin: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      flushbarPosition: flushbarPosition,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: true,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 500),
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
        horizontal: 24.w,
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: TextHelper.inter16bold.copyWith(color: ThemeHelper.white),
      ),
      mainButton: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    ).show(context);
  }
}
