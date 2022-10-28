/* External dependencies */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/pages/house_info_screen/house_info_screen.dart';
import 'package:kars_avia/features/presentation/pages/houses_catalog_screen/houses_catalog_screen.dart';
import 'package:kars_avia/features/presentation/pages/housing_search_screen/bloc/recent_houses_bloc.dart';
import 'package:kars_avia/features/presentation/widgets/all_shimmer_widgets.dart/shimmer_recent_houses.dart';
import 'package:kars_avia/features/presentation/widgets/custom_appbar.dart';
import 'package:kars_avia/features/presentation/widgets/custom_bottom_navigation.dart';
import 'package:kars_avia/features/presentation/widgets/custom_button.dart';
import 'package:kars_avia/features/presentation/widgets/custom_check_box.dart';
import 'package:kars_avia/features/presentation/widgets/custom_error_widget.dart';
import 'package:kars_avia/features/presentation/widgets/custom_textfield.dart';
import 'package:kars_avia/features/presentation/widgets/flushbar.dart';
import 'package:kars_avia/features/presentation/widgets/houses_card.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HousingSearchScreen extends StatefulWidget {
  const HousingSearchScreen({Key? key}) : super(key: key);

  @override
  _HousingSearchScreenState createState() => _HousingSearchScreenState();
}

class _HousingSearchScreenState extends State<HousingSearchScreen> {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  String? _selectedStartDate = '';
  String? _selectedEndDate = '31.12.3050';
  bool isStartController = false;
  bool isEndController = false;
  DateTime dtStart = DateTime.utc(1970, 11, 9);
  DateTime dtEnd = DateTime.utc(3055, 11, 9);
  bool enabledButton = false;

  late RecentHousesBloc bloc;

  @override
  void initState() {
    bloc = RecentHousesBloc();
    bloc.add(GetRecentHousesEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Поиск жилья',
      ),
      body: RefreshIndicator(
        color: ThemeHelper.black,
        onRefresh: () async {
          bloc.add(GetRecentHousesEvent());
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 21.h,
            horizontal: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Укажите город пребывания, где Вам необходимо остановиться',
                style: TextHelper.sf13normal,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: cityController,
                hintText: 'Город',
              ),
              SizedBox(height: 16.h),
              Text(
                'Укажите даты пребывания',
                style: TextHelper.sf13normal,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: startController,
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "##.##.####"),
                      ],
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(13.w, 13.h, 0.w, 10.h),
                        child: Text(
                          'c',
                          style: TextHelper.sf13normal
                              .copyWith(color: ThemeHelper.grey),
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: InkWell(
                          onTap: () {
                            isStartController = true;
                            isEndController = false;

                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return CalendarAlert(
                                    widget: getDateRangePicker(),
                                    startController: startController,
                                    endController: endController,
                                    isStartController: isStartController,
                                    isEndController: isEndController,
                                  );
                                });
                          },
                          child: SvgPicture.asset(
                            'assets/images/calendar_icon.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomTextField(
                      controller: endController,
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "##.##.####"),
                      ],
                      keyboardType: TextInputType.datetime,
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(13.w, 13.h, 13.w, 10.h),
                        child: Text(
                          'до',
                          style: TextHelper.sf13normal
                              .copyWith(color: ThemeHelper.grey),
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: InkWell(
                          onTap: () {
                            isStartController = false;
                            isEndController = true;

                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return CalendarAlert(
                                    widget: getDateRangePicker(),
                                    startController: startController,
                                    endController: endController,
                                    isStartController: isStartController,
                                    isEndController: isEndController,
                                  );
                                });
                          },
                          child: SvgPicture.asset(
                            'assets/images/calendar_icon.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  const CustomCheckBox(), // галочка сейчас не по дизайну
                  SizedBox(width: 8.w),
                  Text(
                    'c питанием',
                    style: TextHelper.sf13normal,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              CustomButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HousesCatalogScreen(
                                stertDate: startController.text,
                                endDate: endController.text,
                              )));
                },
                text: 'Показать варианты',
              ),
              SizedBox(height: 32.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Вы смотрели ранее',
                  style: TextHelper.inter16bold,
                ),
              ),
              SizedBox(height: 27.h),
              BlocConsumer<RecentHousesBloc, RecentHousesState>(
                bloc: bloc,
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is RecentHousesLoadingState) {
                    return const ShimmerHousesCard();
                  }

                  if (state is RecentHousesErrorState) {
                    return CustomErrorWidget(
                      onTap: () {
                        bloc.add(GetRecentHousesEvent());
                      },
                    );
                  }

                  if (state is RecentHousesLoadedState) {
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
      bottomNavigationBar: const CustomBottomNavigation(currentPage: 0),
    );
  }

  Widget getDateRangePicker() {
    return SizedBox(
      height: 255.r,
      width: 255.r,
      child: SfDateRangePicker(
        monthViewSettings: DateRangePickerMonthViewSettings(
          showTrailingAndLeadingDates: true,
          firstDayOfWeek: 1,
          dayFormat: 'EEE',
          viewHeaderStyle: DateRangePickerViewHeaderStyle(
            textStyle: TextHelper.sf10bold.copyWith(
              color: ThemeHelper.grey,
            ),
          ),
        ),
        monthCellStyle: DateRangePickerMonthCellStyle(
          trailingDatesTextStyle:
              TextHelper.sf10bold.copyWith(color: ThemeHelper.grey),
          leadingDatesTextStyle:
              TextHelper.sf10bold.copyWith(color: ThemeHelper.grey),
          blackoutDatesDecoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: const Color(0xFFF44436), width: 1.w),
            shape: BoxShape.circle,
          ),
          weekendTextStyle: TextHelper.sf10bold.copyWith(color: Colors.red),
          textStyle: TextHelper.sf10bold.copyWith(color: Colors.black),
          todayTextStyle: TextHelper.sf10bold.copyWith(color: Colors.black),
        ),
        showNavigationArrow: true,
        view: DateRangePickerView.month,
        todayHighlightColor: Colors.black,
        startRangeSelectionColor: Colors.black,
        rangeSelectionColor: Colors.grey[300],
        selectionColor: Colors.black,
        endRangeSelectionColor: Colors.black,
        selectionMode: DateRangePickerSelectionMode.single,
        onSelectionChanged: selectionChanged,
      ),
    );
  }

  selectionChanged(DateRangePickerSelectionChangedArgs args) {
    Constants.isEnabledButton = true;
    if (isStartController) {
      dtStart = DateTime.parse(args.value.toString().substring(0, 19));
      _selectedStartDate = DateFormat('dd.MM.yyyy').format(dtStart);
      startController.text = _selectedStartDate!;
    }

    if (isEndController) {
      dtEnd = DateTime.parse(args.value.toString().substring(0, 19));
      _selectedEndDate = DateFormat('dd.MM.yyyy').format(dtEnd);
      endController.text = _selectedEndDate!;
    }

    if (dtStart.isAtSameMomentAs(dtEnd)) {
      Constants.isEnabledButton = true;
      Exceptions.showFlushbar('Нельз выбрать текущую дату', context: context);
    }

    if (dtStart.isAfter(dtEnd)) {
      Constants.isEnabledButton = true;
      Exceptions.showFlushbar('Нельз выбрать прошедшую дату', context: context);
    }

    if (dtStart.isBefore(dtEnd)) {
      Constants.isEnabledButton = false;
    }

    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {});
    });
  }
}

class CalendarAlert extends StatelessWidget {
  final Widget widget;
  final TextEditingController startController;
  final TextEditingController endController;
  bool isStartController;
  bool isEndController;

  CalendarAlert({
    Key? key,
    required this.widget,
    required this.startController,
    required this.endController,
    required this.isStartController,
    required this.isEndController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
      child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
          ),
          title: isStartController == true
              ? Text(
                  'Выберите начальную дату',
                  style: TextHelper.sf16normal,
                )
              : isEndController == true
                  ? Text(
                      'Выберите конечную дату',
                      style: TextHelper.sf16normal,
                    )
                  : const SizedBox(),
          content: SizedBox(
            height: 310.h,
            width: 350.w,
            child: Column(
              children: <Widget>[
                widget,
                const Spacer(),
                CustomButton(
                  text: 'ОК',
                  onTap: () {
                    if (Constants.isEnabledButton == false) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class Constants {
  static bool isEnabledButton = true;
}
