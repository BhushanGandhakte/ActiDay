import 'package:actiday/ui/bookings/helper/mobile_upcoming.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../helper/mobile_past.dart';


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
          padding: const EdgeInsets.fromLTRB(14, 4, 16, 0),
          child: SvgPicture.asset(AppAssets.drawerLogo),
        ),
        title: CommonText(title: "My Bookings", fontSize: 18),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    labelStyle: TextStyle(
                        foreground: Paint()..shader = AppColors.clrGradient.createShader(Rect.fromLTWH(0, 0, 200, 70))
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: AppColors.clr808080,
                    ),
                    unselectedLabelColor: AppColors.clr808080,
                    tabs: [
                      Tab(text: "Upcoming"),
                      Tab(text: "Past"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [MobileUpcoming(), MobilePast()]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
