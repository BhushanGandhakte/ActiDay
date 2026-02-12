import 'package:actiday/ui/home/mobile/mobile_home_ui.dart';
import 'package:actiday/ui/home/web/web_home_ui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context){
        return MobileHomeUi();
      },
      desktop: (BuildContext context){
        return WebHomeUi();
      },
    );
  }
}
