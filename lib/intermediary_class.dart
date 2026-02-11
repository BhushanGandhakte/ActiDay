import 'package:actiday/ui/base/mobile/mobile_base_ui.dart';
import 'package:actiday/ui/base/web/web_base_ui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntermediaryClass extends StatelessWidget {
  const IntermediaryClass({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return MobileBaseUi();
      },
      desktop: (BuildContext context){
        return  WebBaseUi();
    },
    );
  }
}
