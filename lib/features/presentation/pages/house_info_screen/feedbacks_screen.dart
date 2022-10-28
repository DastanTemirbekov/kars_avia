/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kars_avia/features/data/models/house_info_model.dart';
import 'package:kars_avia/features/presentation/pages/house_info_screen/widgets/custom_star_card.dart';
import 'package:kars_avia/features/presentation/pages/house_info_screen/widgets/feedback_card.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/widgets/custom_appbar.dart';
import 'package:kars_avia/features/presentation/widgets/custom_bottom_navigation.dart';
import 'package:kars_avia/features/presentation/widgets/custom_button.dart';

class FeedbacksScreen extends StatelessWidget {
  final List<FeedBackList> feedbacksList;
  final String name;

  const FeedbacksScreen({
    Key? key,
    required this.feedbacksList,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Отзывы',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.w, 21.h, 16.w, 40.h),
        // padding: EdgeInsets.symmetric(
        //   vertical: 21.h,
        //   horizontal: 16.w,
        // ),
        child: Column(
          children: [
            Text(
              'Поделитесь Вашими впечатлениями о пребывании в доме, это поможет другим посетителям с выбором, а хозяину или отелю - исправить недочеты и сделать сервис лучше!',
              style: TextHelper.sf13normal,
            ),
            SizedBox(height: 24.h),
            TextField(
              maxLines: 10,
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
              cursorColor: ThemeHelper.black,
              style: TextHelper.sf13normal,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: 'Добавьте ваш отзыв',
                hintStyle:
                    TextHelper.sf13normal.copyWith(color: ThemeHelper.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeHelper.black,
                    width: 1.0.w,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeHelper.black,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 27.h),
            Column(
              children: const [
                CustomStarCard(title: 'Чистота', isFeedback: false),
                CustomStarCard(title: 'Питание', isFeedback: false),
                CustomStarCard(
                    title: 'Соответствие описанию', isFeedback: false),
                CustomStarCard(
                    title: 'Качество обслуживания', isFeedback: false),
                CustomStarCard(title: 'Расположение', isFeedback: false),
              ],
            ),
            SizedBox(height: 57.h),
            CustomButton(
              text: 'Оставить отзыв',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 40.h),
            RichText(
              text: TextSpan(
                text: 'Другие отзывы о ',
                style: TextHelper.sf16normal.copyWith(color: ThemeHelper.black),
                children: [
                  TextSpan(
                    text: '$name:',
                    style:
                        TextHelper.sf16bold.copyWith(color: ThemeHelper.black),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.h),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: feedbacksList.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 30.h);
                },
                itemBuilder: (context, index) {
                  return FeedbackCard(
                      senderName: feedbacksList[index].senderName ?? '',
                      date: feedbacksList[index].date ?? '',
                      feedback: feedbacksList[index].feedback ?? '',
                      cleannessMark: feedbacksList[index].cleannessMark ?? 0,
                      foodMark: feedbacksList[index].foodMark ?? 0,
                      matchTheDescriptionMark:
                          feedbacksList[index].matchTheDescriptionMark ?? 0,
                      qualityOfServiceMark:
                          feedbacksList[index].qualityOfServiceMark ?? 0,
                      locationMark: feedbacksList[index].locationMark ?? 0);
                })
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(currentPage: 0),
    );
  }
}
