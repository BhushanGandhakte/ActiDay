import 'package:actiday/framework/controller/base/web/web_base_control.dart';
import 'package:actiday/ui/base/web/web_base_ui.dart';
import 'package:actiday/ui/login/login.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget{

  final void Function() changeBody;

  const CommonAppBar({super.key, required this.changeBody});

  @override
  State<CommonAppBar> createState() => CommonAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

class CommonAppBarState extends State<CommonAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                widget.changeBody.call();
                print(currentInd);
              },
              child: CommonText(
                title: data.iconName ?? 'NA',
                fontWeight: data.index == currentInd ? FontWeight.bold : FontWeight.normal,
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
            IconButton(
              color: AppColors.clrff0000,
              icon: Icon(Icons.logout_outlined),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context)=> Login()),
                      (route) => false,
                );
              },
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
  }

}

