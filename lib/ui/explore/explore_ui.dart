import 'package:actiday/ui/explore/mobile/mobile_explore_ui.dart';
import 'package:actiday/ui/explore/web/web_explore_ui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExploreUi extends StatefulWidget {
  const ExploreUi({super.key});

  @override
  State<ExploreUi> createState() => _ExploreUiState();
}

class _ExploreUiState extends State<ExploreUi> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context){
        return MobileExploreUi();
      },
      desktop: (context){
        return WebExploreUi();
      },
    );
  }
}
