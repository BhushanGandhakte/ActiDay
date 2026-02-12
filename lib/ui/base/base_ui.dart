import 'package:actiday/ui/base/mobile/mobile_base_ui.dart';
import 'package:actiday/ui/base/web/web_base_ui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BaseUi extends StatefulWidget {
  const BaseUi({super.key});

  @override
  State<BaseUi> createState() => _BaseUiState();
}

class _BaseUiState extends State<BaseUi> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context){
        return MobileBaseUi();
      },
      desktop: (BuildContext context){
        return WebBaseUi();
      },
    );
  }
}
