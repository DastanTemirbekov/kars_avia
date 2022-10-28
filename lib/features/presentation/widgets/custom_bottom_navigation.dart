/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/pages/housing_search_screen/housing_search_screen.dart';
import 'package:kars_avia/features/presentation/pages/messages_screen/messages_screen.dart';
import 'package:kars_avia/features/presentation/pages/profile_screen/profile_screen.dart';
import 'package:kars_avia/features/presentation/pages/transfer_screen/transfer_screen.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentPage;

  const CustomBottomNavigation({
    Key? key,
    this.currentPage = 0,
  }) : super(key: key);

  List<BottomNavigationBarItem> _generateItemList() {
    var items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SvgPicture.asset(
            "assets/images/home_icon.svg",
            height: 23.h,
          ),
        ),
        activeIcon: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SvgPicture.asset(
            "assets/images/home_icon.svg",
            height: 23.h,
            color: ThemeHelper.green,
          ),
        ),
        label: 'Проживание',
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SvgPicture.asset(
            "assets/images/auto_icon.svg",
            height: 23.h,
          ),
        ),
        activeIcon: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SvgPicture.asset(
            "assets/images/auto_icon.svg",
            height: 23.h,
            color: ThemeHelper.green,
          ),
        ),
        label: 'Трансфер',
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SvgPicture.asset(
            "assets/images/messages_icon.svg",
            height: 23.h,
          ),
        ),
        activeIcon: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SvgPicture.asset(
            "assets/images/messages_icon.svg",
            height: 23.h,
            color: ThemeHelper.green,
          ),
        ),
        label: 'Сообщения',
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SvgPicture.asset(
            "assets/images/profile_icon.svg",
            height: 23.h,
          ),
        ),
        activeIcon: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SvgPicture.asset(
            "assets/images/profile_icon.svg",
            height: 23.h,
            color: ThemeHelper.green,
          ),
        ),
        label: 'Профиль',
      ),
    ];

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.r),
        topRight: Radius.circular(10.r),
      ),
      child: BottomNavigationBar(
        backgroundColor: ThemeHelper.black,
        items: _generateItemList(),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(color: ThemeHelper.green),
        unselectedIconTheme: const IconThemeData(color: ThemeHelper.white),
        unselectedLabelStyle: TextHelper.sf11normal,
        showUnselectedLabels: true,
        iconSize: 20.h,
        unselectedFontSize: 11.h,
        selectedFontSize: 11.h,
        onTap: (index) async {
          switch (index) {
            case 0:
              {
                if (currentPage != index) {
                  customRoute(
                    context: context,
                    widget: const HousingSearchScreen(),
                  );
                }

                break;
              }
            case 1:
              {
                if (currentPage != index) {
                  customRoute(
                    context: context,
                    widget: const TransferScreen(),
                  );
                }

                break;
              }

            case 2:
              {
                if (currentPage != index) {
                  customRoute(
                    context: context,
                    widget: const MessagesScreen(),
                  );
                }

                break;
              }
            case 3:
              {
                if (currentPage != index) {
                  customRoute(
                    context: context,
                    widget: const ProfileScreen(),
                  );
                }

                break;
              }
          }
        },
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

customRoute({required Widget widget, required BuildContext context}) {
  Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => widget,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 100),
      ),
      (Route<dynamic> route) => false);
}
