import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/widgets/custom_appbar.dart';
import 'package:kars_avia/features/presentation/widgets/custom_bottom_navigation.dart';

class HistoryOperationScreen extends StatelessWidget {
  const HistoryOperationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'История операций',
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
      bottomNavigationBar: const CustomBottomNavigation(currentPage: 3),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 20),
              child: SizedBox(
                height: 210.h,
                child: Container(
                    decoration: const BoxDecoration(
                        color: ThemeHelper.black,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Бронировка отеля',
                              style: TextHelper.sf16light
                                  .copyWith(color: ThemeHelper.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RowOperationWidget(title: "Название", value: "Astana Park Inn"),
                          SizedBox(
                            height: 10.h,
                          ),
                          RowOperationWidget(title: "Город", value: "Astana"),
                          SizedBox(
                            height: 10.h,
                          ),
                          RowOperationWidget(title: "Тип", value: "Одноместный Suite"),
                          SizedBox(
                            height: 10.h,
                          ),
                          RowOperationWidget(title: "Дата пребывания", value: "с 04.11.2021 до 06.11.2021"),
                          SizedBox(
                            height: 10.h,
                          ),
                          RowOperationWidget(title: "Время заказа", value: "17:23  29.10.1994"),
                          SizedBox(
                            height: 10.h,
                          ),
                          RowOperationWidget(title: "Номер операции", value: "398765456712"),
                          SizedBox(
                            height: 10.h,
                          ),
                          RowOperationWidget(title: "Статус", value: "Выполнено", valueColor: ThemeHelper.green,),
                        ],
                      ),
                    )),
              ),
            );
          }),
    );
  }
}

class RowOperationWidget extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;
  const RowOperationWidget({
    Key? key, required this.title, required this.value, this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextHelper.sf11light.copyWith(color: ThemeHelper.greyA),
        ),
        Spacer(),
        Text(
          value,
          style: TextHelper.sf11light.copyWith(color: valueColor ?? ThemeHelper.white),
        ),
      ],
    );
  }
}
