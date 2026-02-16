import 'package:actiday/framework/repository/bookings/bookings_data.dart';
import 'package:actiday/ui/bookings/mobile/mobile_booking_ui.dart';
import 'package:actiday/ui/explore/web/web_explore_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context){
          return MobileBookingUi();
        },
       desktop: (BuildContext context){
          return WebExploreUi();
       },
    );
  }
}
