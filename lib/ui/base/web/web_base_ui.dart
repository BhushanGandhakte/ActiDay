import 'package:actiday/framework/controller/base/mobile/mobile_base_control.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class WebBaseUi extends StatelessWidget {
  const WebBaseUi({super.key});

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
            MobileBaseControl.bottomMenuData.map((data){

                return InkWell(
                onTap: (){},
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

      bottomNavigationBar: Container(
        height: 100,
        color: AppColors.clr000000,
        child: Row(
          children: [
            CommonText(
                title:  "  Copyright @ 2020-2022 Dreamplug Technologies Pvt. Ltd.",
              color: AppColors.clrfafafa,
            ),
            Spacer(),
            CommonText(
                title: "Privacy Policy  |",
              color: AppColors.clrfafafa,
            ),
            CommonText(
                title: "  terms and conditions  |",
              color: AppColors.clrfafafa,
            ),
            CommonText(
                title: "  returns and refund  ",
              color: AppColors.clrfafafa,
            ),
          ],
        ),
      ),
    );
  }
}
