import 'package:actiday/ui/bookings/helper/web_upcoming.dart';
import 'package:actiday/ui/bookings/helper/web_past.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WebBookingUi extends StatefulWidget {
  const WebBookingUi({super.key});

  @override
  State<WebBookingUi> createState() => _WebBookingUiState();
}

class _WebBookingUiState extends State<WebBookingUi> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveBuilder(
            builder: (BuildContext context, SizingInformation sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg/home.svg', height: screenWidth * 0.02, width: screenWidth * 0.02),
                            SizedBox(width: screenWidth * 0.01),
                            Icon(Icons.arrow_forward_ios_rounded, size: screenWidth * 0.01),
                            SizedBox(width: screenWidth * 0.01),
                            CommonText(
                              title: "Bookings",
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.015,
                            ),
                          ],
                        ),
                        SizedBox(height: screenWidth * 0.015),
                        CommonText(
                          title: "Bookings",
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.02,
                        ),
                        SizedBox(height: screenWidth * 0.015),
                        SizedBox(
                          width: screenWidth * 0.97,
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
                                    Text(
                                        "Upcoming",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                        "Past",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenWidth * 0.02),
                                SizedBox(
                                    height: screenWidth * 0.3,
                                    width: screenWidth * 0.8,
                                    child: TabBarView(
                                        children: [WebUpcoming(), WebPast()]
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
    );
  }
}
