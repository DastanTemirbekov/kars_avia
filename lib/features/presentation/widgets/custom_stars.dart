/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/theme_helper.dart';

class CustomStars extends StatelessWidget {
  final double? initialRating;
  final bool? ignoreGestures;

  const CustomStars({
    Key? key,
    this.initialRating = 0,
    this.ignoreGestures = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 23.r,
      glow: false,
      initialRating: initialRating!,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      unratedColor: Colors.grey[300],
      itemBuilder: (context, _) => const Icon(
        Icons.star_rounded,
        color: ThemeHelper.green,
      ),
      ignoreGestures: ignoreGestures!,
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
