/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/presentation/pages/auth_screen/auth_screen.dart';
import 'package:kars_avia/features/presentation/widgets/custom_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/main_background.png',
            fit: BoxFit.fill,
            height: 1.sh,
            width: 1.sw,
          ),
          Center(
            child: Container(
              height: 302.h,
              width: 328.w,
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 48.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white.withOpacity(0.9),
              ),
              child: Column(
                children: [
                  Text(
                    'Kars Avia',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'Самый удобный сервис для Ваших деловых поездок',
                    textAlign: TextAlign.center,
                    style: TextHelper.sf16normal,
                  ),
                  SizedBox(height: 40.h),
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AuthScreen()));
                    },
                    text: 'Войти или зарегистрироваться',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
