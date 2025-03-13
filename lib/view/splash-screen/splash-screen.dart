import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:smart_web/view/home/home.dart';

import '../../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/images/logo.png"),
      backgroundColor: AppColors.backgroundColor,
      navigator: HomeScreen(),
      logoWidth: 100.w,
      durationInSeconds: 1,
    );
  }
}
