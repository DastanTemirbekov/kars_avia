/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/widgets/custom_cached_network_image.dart';

class HousesCard extends StatelessWidget {
  final String city;
  final String description;
  final String imageUrl;
  final String name;
  final Function? onTap;

  const HousesCard({
    Key? key,
    required this.city,
    required this.description,
    required this.imageUrl,
    required this.name,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap != null ? onTap!() : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 117.h,
            width: 156.w,
            decoration: BoxDecoration(
              color: ThemeHelper.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: ThemeHelper.black),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CustomCachedNetworkImage(imageUrl: imageUrl),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: TextHelper.sf11normal,
          ),
          SizedBox(height: 4.h),
          Text(
            city,
            overflow: TextOverflow.ellipsis,
            style: TextHelper.sf11normal.copyWith(color: ThemeHelper.grey),
          ),
          SizedBox(height: 4.h),
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            style: TextHelper.sf11normal.copyWith(color: ThemeHelper.grey),
          ),
        ],
      ),
    );
  }
}
