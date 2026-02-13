import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MobileBookingUi extends StatefulWidget {
  const MobileBookingUi({super.key});

  @override
  State<MobileBookingUi> createState() => _MobileBookingUiState();
}

class _MobileBookingUiState extends State<MobileBookingUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(14,4, 16, 0),
          child: SvgPicture.asset(AppAssets.drawerLogo),
        ),
        title: CommonText(
          title: "My Bookings",
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: AppColors.clr808080,
                    tabs: [
                      Tab(text: "Upcoming"),
                      Tab(text: "Past")
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
