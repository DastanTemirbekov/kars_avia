/* External dependencies */
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/theme_helper.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget? child;

  const ShimmerWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeHelper.silver,
      highlightColor: ThemeHelper.lightSilver,
      child: child!,
    );
  }
}
