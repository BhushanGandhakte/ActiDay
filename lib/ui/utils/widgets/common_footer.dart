import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class CommonFooter extends StatelessWidget {

  final double? screenWidth;

  const CommonFooter({super.key, this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (screenWidth ?? 1200) * 0.075,
      color: AppColors.clr000000,
      child: Row(
        children: [
          CommonText(
            title:  "  Copyright @ 2020-2022 Dreamplug Technologies Pvt. Ltd.",
            fontSize: (screenWidth ?? 1200) * 0.0125,
            color: AppColors.clrFaFaFa,
          ),
          Spacer(),
          CommonText(
            title: "Privacy Policy  |  terms and conditions  |  returns and refund  ",
            fontSize: (screenWidth ?? 1200) * 0.0125,
            color: AppColors.clrFaFaFa,
          ),
        ],
      ),
    );
  }
}
