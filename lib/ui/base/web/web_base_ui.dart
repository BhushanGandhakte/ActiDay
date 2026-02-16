import 'package:actiday/framework/controller/base/web/web_base_control.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class WebBaseUi extends StatefulWidget {
  const WebBaseUi({super.key});

  @override
  State<WebBaseUi> createState() => _WebBaseUiState();
}

class _WebBaseUiState extends State<WebBaseUi> {

  int? currentInd = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.clrf0f5f9,
         leadingWidth: 150,
         leading:
             Padding(
               padding: const EdgeInsets.only(left: 80),
               child: Image.asset(
                   AppAssets.webLogo,
               ),
             ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children:
            WebBaseControl.appBarMenuData.map((data){
                return InkWell(

                onTap: (){
                  currentInd = data.index;
                  changeBody(currentInd);
                  print(currentInd);
                  setState(() {

                  });
                },
                child: CommonText(
                    title: data.iconName ?? 'NA',
                ),
                );
            }).toList()
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Icon(Icons.search),
              Icon(Icons.notifications_none_rounded),
              Image.asset(AppAssets.webProfile),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ],
      ),
      body: changeBody(currentInd),
    );
  }

  Widget? changeBody(int? currentInd) {
    return WebBaseControl.appBarMenuData[currentInd ?? 0].screenName;
  }
}
