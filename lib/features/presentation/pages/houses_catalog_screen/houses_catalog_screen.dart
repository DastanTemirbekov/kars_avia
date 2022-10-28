/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/pages/house_info_screen/house_info_screen.dart';
import 'package:kars_avia/features/presentation/pages/houses_catalog_screen/bloc/houses_catalog_bloc.dart';
import 'package:kars_avia/features/presentation/widgets/all_shimmer_widgets.dart/shimmer_recent_houses.dart';
import 'package:kars_avia/features/presentation/widgets/custom_appbar.dart';
import 'package:kars_avia/features/presentation/widgets/custom_bottom_navigation.dart';
import 'package:kars_avia/features/presentation/widgets/houses_card.dart';

class HousesCatalogScreen extends StatefulWidget {
  final String stertDate;
  final String endDate;

  const HousesCatalogScreen({
    Key? key,
    required this.stertDate,
    required this.endDate,
  }) : super(key: key);

  @override
  _HousesCatalogScreenState createState() => _HousesCatalogScreenState();
}

class _HousesCatalogScreenState extends State<HousesCatalogScreen> {
  late HousesCatalogBloc bloc;

  @override
  void initState() {
    bloc = HousesCatalogBloc();
    bloc.add(GetHousesEvent());

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
      body: RefreshIndicator(
        color: ThemeHelper.black,
        onRefresh: () async {
          bloc.add(GetHousesEvent());
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 21.h,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Вы искали: Калининград\n${widget.stertDate != '' ? widget.stertDate : '07.08.2022'} - ${widget.endDate != '' ? widget.endDate : '17.08.2022'}\nпитание включено',
                  style: TextHelper.inter16bold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                BlocConsumer<HousesCatalogBloc, HousesCatalogState>(
                  bloc: bloc,
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is HousesCatalogLoadingState) {
                      return const ShimmerHousesCard();
                    }

                    if (state is HousesCatalogErrorState) {
                      return Center(
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            bloc.add(GetHousesEvent());
                          },
                          icon: Icon(
                            Icons.refresh,
                            size: 40.r,
                          ),
                        ),
                      );
                    }

                    if (state is HousesCatalogLoadedState) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 13.w,
                            mainAxisSpacing: 24.h,
                            mainAxisExtent: 175.h,
                          ),
                          itemCount: state.model.length,
                          itemBuilder: (context, index) {
                            return HousesCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HouseInfoScreen(
                                      id: state.model[index].id ?? 0,
                                    ),
                                  ),
                                );
                              },
                              city: state.model[index].city ?? '',
                              description: state.model[index].description ?? '',
                              imageUrl: state.model[index].imageUrl ?? '',
                              name: state.model[index].name ?? '',
                            );
                          });
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(currentPage: 0),
    );
  }
}
