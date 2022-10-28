/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function? onTap;

  const CustomButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: ThemeHelper.black,
        foregroundColor: ThemeHelper.black,
        padding: EdgeInsets.symmetric(
          vertical: 13.h,
          horizontal: 14.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
      ).copyWith(
        elevation: MaterialStateProperty.all(0.0),
      ),
      onPressed: () => onTap != null ? onTap!() : null,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextHelper.inter16bold.copyWith(color: ThemeHelper.white),
        ),
      ),
    );
  }
}
