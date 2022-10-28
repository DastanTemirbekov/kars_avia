/* External dependencies */
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/pages/house_info_screen/feedbacks_screen.dart';
import 'package:kars_avia/features/presentation/pages/house_info_screen/bloc/house_info_bloc.dart';
import 'package:kars_avia/features/presentation/pages/housing_search_screen/housing_search_screen.dart';
import 'package:kars_avia/features/presentation/widgets/all_shimmer_widgets.dart/shimmer_house_info.dart';
import 'package:kars_avia/features/presentation/widgets/custom_appbar.dart';
import 'package:kars_avia/features/presentation/widgets/custom_bottom_navigation.dart';
import 'package:kars_avia/features/presentation/widgets/custom_button.dart';
import 'package:kars_avia/features/presentation/widgets/custom_cached_network_image.dart';
import 'package:kars_avia/features/presentation/widgets/custom_error_widget.dart';

class HouseInfoScreen extends StatefulWidget {
  final int id;

  const HouseInfoScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _HouseInfoScreenState createState() => _HouseInfoScreenState();
}

class _HouseInfoScreenState extends State<HouseInfoScreen> {
  int activeIndex = 0;
  late HouseInfoBloc bloc;
  @override
  void initState() {
    bloc = HouseInfoBloc();
    bloc.add(GetHouseByIDEvent(id: widget.id));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Результаты поиска',
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: ThemeHelper.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<HouseInfoBloc, HouseInfoState>(
          bloc: bloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HouseInfoLoadingState) {
              return SizedBox(
                height: 1.sh,
                child: const ShimmerHouseInfo(),
              );
            }

            if (state is HouseInfoErrorState) {
              return CustomErrorWidget(
                onTap: () {
                  bloc.add(GetHouseByIDEvent(id: widget.id));
                },
              );
            }
            if (state is HouseInfoLoadedState) {
              return RefreshIndicator(
                color: ThemeHelper.black,
                onRefresh: () async {
                  bloc.add(GetHouseByIDEvent(id: widget.id));
                },
                child: Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                      children: [
                        SizedBox(height: 45.h),
                        state.model.imagesUrl!.isEmpty
                            ? const SizedBox()
                            : CarouselSlider.builder(
                                itemCount: state.model.imagesUrl!.length,
                                itemBuilder: (context, index, realIndex) {
                                  final urlImage =
                                      state.model.imagesUrl![index];
                                  return buildImage(urlImage, index);
                                },
                                options: CarouselOptions(
                                  height: 169.h,
                                  viewportFraction: 0.75,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  },
                                ),
                              ),
                        SizedBox(height: 14.h),
                        buildIndicator(
                          activeIndex: activeIndex,
                          count: state.model.imagesUrl!.length,
                        ),
                        SizedBox(height: 35.h),
                        Text(
                          state.model.name ?? '',
                          style: TextHelper.sf16bold,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          state.model.city ?? '',
                          style: TextHelper.sf16normal,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          state.model.houseType ?? '',
                          style: TextHelper.sf16normal.copyWith(
                            color: ThemeHelper.grey,
                            fontWeight: FontWeight.w300,
                          ),
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
                                vertical: 9.r,
                                horizontal: 7.r,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                              ),
                            ).copyWith(
                              elevation: MaterialStateProperty.all(0.0),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeedbacksScreen(
                                            feedbacksList:
                                                state.model.feedbacksList ?? [],
                                            name: state.model.name ?? '',
                                          )));
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Отзывы',
                                  textAlign: TextAlign.center,
                                  style: TextHelper.inter16bold
                                      .copyWith(color: ThemeHelper.white),
                                ),
                                const Spacer(),
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
                            child: Text(
                              'Описание',
                              style: TextHelper.sf16bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              state.model.description ?? '',
                              style: TextHelper.sf12normal,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h)
                      ],
                    ))),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 18.h),
                      child: CustomButton(
                        text: 'Забронировать отель',
                        onTap: () {
                          customRoute(
                            context: context,
                            widget: const HousingSearchScreen(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          }),
      bottomNavigationBar: const CustomBottomNavigation(currentPage: 0),
    );
  }
}

Widget buildIndicator({required int activeIndex, required int count}) {
  return AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: count,
    effect: SlideEffect(
      activeDotColor: ThemeHelper.black,
      dotHeight: 6.r,
      dotWidth: 6.r,
      paintStyle: PaintingStyle.stroke,
    ),
  );
}

Widget buildImage(String imageUrl, int index) {
  return Container(
    width: 255.w,
    decoration: BoxDecoration(
      color: ThemeHelper.white,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: ThemeHelper.black),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CustomCachedNetworkImage(imageUrl: imageUrl),
    ),
  );
}
