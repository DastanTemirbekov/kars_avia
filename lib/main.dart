/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';

/* Local dependencies */
import 'package:kars_avia/features/presentation/pages/housing_search_screen/housing_search_screen.dart';
import 'package:kars_avia/features/presentation/pages/main_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokenBox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var box = Hive.box('tokenBox');
  late String token;

  @override
  void initState() {
    token = box.get('token', defaultValue: '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: FlutterSmartDialog.init(),
          debugShowCheckedModeBanner: false,
          title: 'Kars Avia',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: child,
        );
      },
      child:
          token.isNotEmpty ? const HousingSearchScreen() : const MainScreen(),
    );
  }
}
