import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../splash/splash.dart';

class MobileBookingDetails extends StatefulWidget {

  final int index;
  final bool isUpcoming;
  final bool isPast;

  const MobileBookingDetails({super.key, required this.index, required this.isUpcoming, required this.isPast});

  @override
  State<MobileBookingDetails> createState() => _MobileBookingDetailsState();
}

class _MobileBookingDetailsState extends State<MobileBookingDetails> {

  late final item = SplashState.bookings?.upcoming?[widget.index];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) { 
        double screenWidth = sizingInformation.screenSize.width;

        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: CommonText(
                title: "Booking Details",
                fontWeight: FontWeight.bold,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.all(screenWidth * 0.03),
                child: Stack(
                  children : [
                  Column(
                    children: [
                      CommonContainer(
                        borderRadius: 20,
                        height: screenWidth * 0.6,
                        width: screenWidth * 0.95,
                        color: AppColors.clrFfFfFf,
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.3,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        title: item?.title ?? 'NA',
                                        fontSize: 18,
                                      ),
                                      SizedBox(
                                        height: screenWidth * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                          ),
                                          CommonText(
                                            title: item?.address?.substring(4) ?? 'NA',
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.01,
                                          ),
                                          Icon(
                                            Icons.circle,
                                            size: screenWidth * 0.005,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.01,
                                          ),
                                          Icon(Icons.star),
                                          CommonText(
                                            title: "${item?.rating}",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenWidth * 0.1,
                              ),
                              Container(
                                height: screenWidth * 0.1,
                                color: AppColors.clrF3F3F3,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CommonText(
                                            title: item?.category ?? 'NA',
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.445,
                                          ),
                                          CommonText(
                                            title:
                                            "${item?.credit} Credit",
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenWidth * 0.006,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.access_time_rounded),
                                          SizedBox(
                                            width: screenWidth * 0.005,
                                          ),
                                          CommonText(
                                            title: item?.time ?? 'NA',
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenWidth * 0.006,
                                      ),
                                      Row(
                                        children: [
                                          CommonText(title: 'Specialist'),
                                          SizedBox(
                                            width: screenWidth * 0.45,
                                          ),
                                          CommonText(
                                            title:
                                            item?.specialist ?? 'NA',
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenWidth * 0.006,
                                      ),
                                      Row(
                                        children: [
                                          CommonText(title: "Time Slot"),
                                          SizedBox(
                                            width: screenWidth * 0.41,
                                          ),
                                          CommonText(
                                            title: item?.timeSlot ?? 'NA',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.01),
                      CommonText(
                        title: "Payment Summary",
                        fontSize: screenWidth * 0.015,
                      ),
                      SizedBox(height: screenWidth * 0.01),
                      CommonContainer(
                        borderRadius: 20,
                        height: screenWidth * 0.1,
                        width: screenWidth * 0.6,
                        color: AppColors.clrF0F5F9,
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  CommonText(title: "Booking Total"),
                                  SizedBox(width: screenWidth * 0.445),
                                  CommonText(
                                    title: "${item?.credit} Credit",
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  CommonText(title: "Order Total"),
                                  SizedBox(width: screenWidth * 0.445),
                                  CommonText(
                                    title: "${item?.credit} Credit",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.03),
                    ],
                  ),
                    Positioned(
                      top: screenWidth * 0.02,
                        left: screenWidth * 0.01,
                        child:  Image.asset(
                          'assets/images/booking.png',
                          height: screenWidth * 0.3,
                          width: screenWidth * 0.3,
                        ),
                    )
                  ]
                ),
              ),
            )
        );
      },
    );
  }
}
