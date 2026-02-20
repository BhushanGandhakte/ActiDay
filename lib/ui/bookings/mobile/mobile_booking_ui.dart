import 'package:actiday/ui/bookings/helper/mobile_upcoming.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../helper/mobile_past.dart';


class MobileBookingUi extends StatefulWidget {
  const MobileBookingUi({super.key});

  @override
  State<MobileBookingUi> createState() => _MobileBookingUiState();
}

class _MobileBookingUiState extends State<MobileBookingUi> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.04, screenWidth * 0.02, screenWidth * 0.04, 0),
              child: SvgPicture.asset(AppAssets.drawerLogo),
            ),
            title: CommonText(title: "My Bookings", fontSize: screenWidth * 0.05),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      CommonContainer(
                        height : screenWidth * 0.15,
                        width: screenWidth * 0.9,
                        borderRadius: screenWidth * 0.2,
                        child: TabBar(
                          splashBorderRadius: BorderRadius.circular(20),
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          indicatorColor: AppColors.clrF048c6,
                          tabAlignment: TabAlignment.center,
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
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          MobileUpcoming(
                            screenWidth: screenWidth * 3,
                            height: screenWidth * 0.4,
                          ),
                          MobilePast(
                            screenWidth: screenWidth * 3,
                            height: screenWidth * 0.4,
                          )
                        ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
