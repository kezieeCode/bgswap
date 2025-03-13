import 'package:flutter/material.dart';
import 'package:smart_web/view/splash-screen/splash-screen.dart';

import 'utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(768, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'BV Swap',
        theme: ThemeData(
          buttonTheme: ButtonThemeData(buttonColor: AppColors.buttonColor),
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.backgroundColor),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
