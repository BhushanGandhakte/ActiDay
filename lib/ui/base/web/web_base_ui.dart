import 'package:actiday/framework/controller/base/web/web_base_control.dart';
import 'package:actiday/ui/home/web/web_home_ui.dart';
import 'package:actiday/ui/utils/widgets/common_app_bar.dart';
import 'package:actiday/ui/utils/widgets/common_footer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WebBaseUi extends StatefulWidget {
  const WebBaseUi({super.key});

  @override
  State<WebBaseUi> createState() => _WebBaseUiState();
}

int? currentInd = 0;

Widget? changeBody(int? currentInd) {
return WebBaseControl.appBarMenuData[currentInd ?? 0].screenName;
}

class _WebBaseUiState extends State<WebBaseUi> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CommonAppBar(changeBody: (){
        setState(() {}
        );}),
      body:  ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          return  CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                      [
                        changeBody(currentInd) ?? WebHomeUi(),
                      ]
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CommonFooter(screenWidth: screenWidth),
                  ),
                )
              ]
          );
        },
      ),
    );
  }
}
