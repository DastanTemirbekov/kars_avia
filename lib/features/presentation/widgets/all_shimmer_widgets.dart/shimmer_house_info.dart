/* External dependencies */
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kars_avia/features/data/constants/text_helper.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/pages/house_info_screen/house_info_screen.dart';
import 'package:kars_avia/features/presentation/widgets/all_shimmer_widgets.dart/shimmer_widget.dart';
import 'package:kars_avia/features/presentation/widgets/custom_button.dart';

class ShimmerHouseInfo extends StatelessWidget {
  const ShimmerHouseInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 45.h),
                  CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = imagesUrl[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                      height: 169.h,
                      viewportFraction: 0.75,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {},
                    ),
                  ),
                  SizedBox(height: 14.h),
                  buildIndicator(
                    activeIndex: 0,
                    count: 5,
                  ),
                  SizedBox(height: 35.h),
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
                  SizedBox(height: 18.h),
                  SizedBox(
                    width: 100.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        backgroundColor: ThemeHelper.green,
                        foregroundColor: ThemeHelper.green,
                        padding: EdgeInsets.symmetric(
                          vertical: 9.h,
                          horizontal: 7.w,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                      ).copyWith(
                        elevation: MaterialStateProperty.all(0.0),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Отзывы',
                            textAlign: TextAlign.center,
                            style: TextHelper.inter16bold
                                .copyWith(color: ThemeHelper.white),
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: ThemeHelper.white,
                            size: 23.r,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 16.h,
                        width: 100.w,
                        color: ThemeHelper.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 300.h,
                        // width: 100.w,
                        color: ThemeHelper.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 18.h),
            child: Center(
              child: CustomButton(
                text: 'Забронировать отель',
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final imagesUrl = [
  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
  'https://eurostyle.kg/files/products/%20%D1%81%203%D0%B4%D0%B2%20%D1%88%D0%BA_1.960x580.jpg?3a4378126fc188673b28780ee889e7b5',
  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
  'https://eurostyle.kg/files/products/%20%D1%81%203%D0%B4%D0%B2%20%D1%88%D0%BA_1.960x580.jpg?3a4378126fc188673b28780ee889e7b5',
  'https://eurostyle.kg/files/products/%20%D1%81%203%D0%B4%D0%B2%20%D1%88%D0%BA_1.960x580.jpg?3a4378126fc188673b28780ee889e7b5',
];
