/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';

class CustomProgressIndicator {
  static customProgressIndicator({
    required String message,
  }) {
    SmartDialog.showLoading(
      msg: message,
      builder: (_) => Container(
        height: 130.h,
        width: 130.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: ThemeHelper.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularProgressIndicator(
              color: ThemeHelper.white,
              strokeWidth: 2.0.w,
            ),
            Text(
              message,
              style: TextHelper.sf16normal.copyWith(color: ThemeHelper.white),
            ),
          ],
        ),
      ),
    );
  }
}
