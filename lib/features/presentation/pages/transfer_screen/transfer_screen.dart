/* External dependencies */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/widgets/custom_appbar.dart';
import 'package:kars_avia/features/presentation/widgets/custom_bottom_navigation.dart';
import 'package:kars_avia/features/presentation/widgets/custom_button.dart';
import 'package:kars_avia/features/presentation/widgets/custom_check_box.dart';
import 'package:kars_avia/features/presentation/widgets/custom_textfield.dart';
import 'package:kars_avia/features/presentation/widgets/show_sheet.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  DateTime dateTime = DateTime.now();
  var dateValue = '00:00';

  @override
  void initState() {
    super.initState();

    dateTime = getDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Поиск трансфера'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 21.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Откуда Вас забрать?',
                style: TextHelper.inter16bold,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Укажите город',
              style: TextHelper.sf13normal,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Город',
            ),
            SizedBox(height: 16.h),
            Text(
              'Укажите адрес',
              style: TextHelper.sf13normal,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Улица, дом',
            ),
            SizedBox(height: 21.h),
            Center(
              child: Text(
                'Укажите место назначения',
                style: TextHelper.inter16bold,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Укажите город',
              style: TextHelper.sf13normal,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Город',
            ),
            SizedBox(height: 16.h),
            Text(
              'Укажите адрес',
              style: TextHelper.sf13normal,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Улица, дом',
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                const CustomCheckBox(), // галочка сейчас не по дизайну
                SizedBox(width: 8.w),
                Text(
                  'заказ на определенное время',
                  style: TextHelper.sf13normal,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              'Укажите время',
              style: TextHelper.sf13normal,
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: () {
                Utils.showSheet(
                  context,
                  child: buildTimePicker(),
                  onClicked: () {
                    setState(() {
                      dateValue = DateFormat('HH:mm').format(dateTime);
                    });

                    Navigator.pop(context);
                  },
                );
              },
              child: Container(
                  padding: EdgeInsets.only(left: 13.w),
                  alignment: Alignment.centerLeft,
                  width: 156.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ThemeHelper.black,
                        width: 1.0.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    dateValue,
                    style: TextHelper.sf13normal.copyWith(
                      color: ThemeHelper.grey,
                    ),
                  )),
            ),
            SizedBox(height: 16.h),
            CustomButton(
              text: 'Заказать трансфер',
              onTap: () {},
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(currentPage: 1),
    );
  }

  Widget buildTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          // minuteInterval: 10,
          use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );

  DateTime getDateTime() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, now.hour, 0);
  }
}
