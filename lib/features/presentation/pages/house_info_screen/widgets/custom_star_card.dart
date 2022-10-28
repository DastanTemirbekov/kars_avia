/* External dependencies */
import 'package:flutter/material.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/presentation/widgets/custom_stars.dart';

class CustomStarCard extends StatelessWidget {
  final String title;
  final double? initialRating;
  final bool isFeedback;
  final bool? ignoreGestures;

  const CustomStarCard({
    Key? key,
    required this.title,
    this.initialRating = 0,
    this.isFeedback = true,
    this.ignoreGestures = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextHelper.sf13normal,
          ),
        ),
        !isFeedback
            ? Expanded(
                child: CustomStars(initialRating: initialRating),
              )
            : CustomStars(
                initialRating: initialRating,
                ignoreGestures: ignoreGestures,
              )
      ],
    );
  }
}
