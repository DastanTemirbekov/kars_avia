/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';

class FeedbackSenderCard extends StatelessWidget {
  final String? senderName;
  final String? date;

  const FeedbackSenderCard({
    Key? key,
    required this.senderName,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 0.5.sw,
          child: Text(
            senderName!,
            style: TextHelper.sf12bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          width: 0.3.sw,
          child: Text(
            date!,
            style: TextHelper.sf12normal,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
