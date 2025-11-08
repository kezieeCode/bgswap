import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_web/view/splash-screen/splash-screen.dart';
import 'routing/app_routes.dart';
import 'view/pages/simple_pages.dart';

import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Try to load environment variables, but don't fail if not available
  try {
    await dotenv.load(fileName: ".env");
    print("Environment variables loaded successfully");
  } catch (e) {
    // This is expected on web or if .env file is not found
    print("Environment variables not loaded (this is normal for web): $e");
  }
  
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
        routes: {
          AppRoutes.explorer: (context) => const ExplorerPage(),
          AppRoutes.bridges: (context) => const BridgesPage(),
          AppRoutes.network: (context) => const NetworkPage(),
        },
        home: const SplashScreen(),
      ),
    );
  }
}
