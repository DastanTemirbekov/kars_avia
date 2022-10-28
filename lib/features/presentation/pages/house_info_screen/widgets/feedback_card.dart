/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/pages/house_info_screen/widgets/custom_star_card.dart';
import 'package:kars_avia/features/presentation/pages/house_info_screen/widgets/feedback_sender_card.dart';

class FeedbackCard extends StatelessWidget {
  final String senderName;
  final String date;
  final String feedback;
  final double cleannessMark;
  final double foodMark;
  final double matchTheDescriptionMark;
  final double qualityOfServiceMark;
  final double locationMark;

  const FeedbackCard({
    Key? key,
    required this.senderName,
    required this.date,
    required this.feedback,
    required this.cleannessMark,
    required this.foodMark,
    required this.matchTheDescriptionMark,
    required this.qualityOfServiceMark,
    required this.locationMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeHelper.black,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
            child: FeedbackSenderCard(
              senderName: senderName,
              date: date,
            ),
          ),
          Divider(
            color: ThemeHelper.black,
            thickness: 1.w,
            height: 1.r,
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: Text(
              feedback,
              style: TextHelper.sf12normal,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
            child: Column(
              children: [
                CustomStarCard(
                  title: 'Чистота',
                  initialRating: cleannessMark,
                  ignoreGestures: true,
                ),
                CustomStarCard(
                  title: 'Питание',
                  initialRating: foodMark,
                  ignoreGestures: true,
                ),
                CustomStarCard(
                  title: 'Соответствие описанию',
                  initialRating: matchTheDescriptionMark,
                  ignoreGestures: true,
                ),
                CustomStarCard(
                  title: 'Качество обслуживания',
                  initialRating: qualityOfServiceMark,
                  ignoreGestures: true,
                ),
                CustomStarCard(
                  title: 'Расположение',
                  initialRating: locationMark,
                  ignoreGestures: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
