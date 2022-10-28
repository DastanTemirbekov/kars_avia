/* External dependencies */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/theme_helper.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? iconSize;

  const CustomCachedNetworkImage(
      {Key? key, required this.imageUrl, this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: ThemeHelper.black,
              ),
            ),
        errorWidget: (context, url, error) {
          return Icon(
            Icons.error,
            size: iconSize ?? 50.h,
          );
        });
  }
}
