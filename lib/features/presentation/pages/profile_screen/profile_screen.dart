/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/pages/main_screen.dart';
import 'package:kars_avia/features/presentation/pages/profile_screen/history_operation_screen.dart';
import 'package:kars_avia/features/presentation/widgets/custom_appbar.dart';
import 'package:kars_avia/features/presentation/widgets/custom_bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Профиль'),
      bottomNavigationBar: const CustomBottomNavigation(currentPage: 3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26),
            child: Image.asset("assets/images/ic_avatar.png"),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Name\nSurname',
            textAlign: TextAlign.center,
            style: TextHelper.inter16bold.copyWith(color: ThemeHelper.black),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryOperationScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: ThemeHelper.black,
                foregroundColor: ThemeHelper.black,
                padding: EdgeInsets.symmetric(
                  vertical: 13.h,
                  horizontal: 14.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
              ).copyWith(
                elevation: MaterialStateProperty.all(0.0),
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(
                      // <-- Icon
                      Icons.history_rounded,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "История операций",
                      textAlign: TextAlign.center,
                      style: TextHelper.inter16bold
                          .copyWith(color: ThemeHelper.white),
                    ), // <-- Text
                    const Spacer(),
                    const Icon(
                      // <-- Icon
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: ThemeHelper.black,
                  foregroundColor: ThemeHelper.black,
                  padding: EdgeInsets.symmetric(
                    vertical: 13.h,
                    horizontal: 14.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                ).copyWith(
                  elevation: MaterialStateProperty.all(0.0),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        // <-- Icon
                        Icons.star_border,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Мои отзывы",
                        textAlign: TextAlign.center,
                        style: TextHelper.inter16bold
                            .copyWith(color: ThemeHelper.white),
                      ), // <-- Text
                      const Spacer(),
                      const Icon(
                        // <-- Icon
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: ElevatedButton(
              onPressed: () async {
                await Hive.box('tokenBox').delete('token');

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                    (Route<dynamic> route) => false);
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: ThemeHelper.black,
                foregroundColor: ThemeHelper.black,
                padding: EdgeInsets.symmetric(
                  vertical: 13.h,
                  horizontal: 14.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
              ).copyWith(
                elevation: MaterialStateProperty.all(0.0),
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      // <-- Icon
                      Icons.logout,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Выйти с профиля",
                      textAlign: TextAlign.start,
                      style: TextHelper.inter16bold
                          .copyWith(color: ThemeHelper.red),
                    ), // <-- Text
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
