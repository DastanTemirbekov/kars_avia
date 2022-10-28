/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/theme_helper.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);

    return ValueListenableBuilder<bool>(
        valueListenable: isChecked,
        builder: (BuildContext context, bool value, Widget? child) {
          return SizedBox(
            height: 14.r,
            width: 14.r,
            child: Checkbox(
              side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(
                  color: ThemeHelper.black,
                  width: 2.w,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              checkColor: ThemeHelper.black,
              value: isChecked.value,
              fillColor: MaterialStateProperty.all(ThemeHelper.white),
              onChanged: (bool? value) {
                isChecked.value = !isChecked.value;
              },
            ),
          );
        });
  }
}
