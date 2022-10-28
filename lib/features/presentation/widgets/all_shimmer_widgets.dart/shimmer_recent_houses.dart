/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/widgets/all_shimmer_widgets.dart/shimmer_widget.dart';

class ShimmerHousesCard extends StatelessWidget {
  const ShimmerHousesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13.w,
          mainAxisSpacing: 24.h,
          mainAxisExtent: 173.h,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShimmerWidget(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 117.h,
                width: 157.w,
                decoration: BoxDecoration(
                  color: ThemeHelper.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: ThemeHelper.black),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 11.h,
                width: 115.w,
                color: ThemeHelper.white,
              ),
              SizedBox(height: 4.h),
              Container(
                height: 11.h,
                width: 100.w,
                color: ThemeHelper.white,
              ),
              SizedBox(height: 4.h),
              Container(
                height: 11.h,
                width: 140.w,
                color: ThemeHelper.white,
              ),
            ],
          ));

          //   RecentHousesCard(
          //     city: 'Moscow Park Inn',
          //     description: 'Одноместный Suite',
          //     imageUrl: '',
          //     name: 'Москва',
          //   ),
          // );
        });
  }
}
