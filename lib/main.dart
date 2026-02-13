import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actiday',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.clrfafafa,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.clrfafafa,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.clrfafafa,
        )
      ),
      home: Splash(),
    );
  }
}

