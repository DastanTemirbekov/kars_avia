import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';

class CustomButtonWithIcons extends StatelessWidget {
  final String text;
  final String? iconLeft;
  final String? iconRight;
  final bool? isRedText;
  final Function? onTap;

  const CustomButtonWithIcons({
    Key? key,
    required this.text,
    this.onTap,
    this.iconLeft,
    this.iconRight,
    this.isRedText,
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon( // <-- Icon
              Icons.star_border,
              color: Colors.white,
              size: 24.0,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextHelper.inter16bold.copyWith(color: ThemeHelper.white),
            ), // <-- Text
            SizedBox(
              width: 10,
            ),
            Icon( // <-- Icon
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
