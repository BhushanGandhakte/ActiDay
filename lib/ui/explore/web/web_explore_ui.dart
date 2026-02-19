import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class WebExploreUi extends StatefulWidget {
  const WebExploreUi({super.key});

  @override
  State<WebExploreUi> createState() => _WebExploreUiState();
}

class _WebExploreUiState extends State<WebExploreUi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonText(
            title: "Comming Soon",
          fontSize: 24,
        ),
      ],
    );
  }
}
