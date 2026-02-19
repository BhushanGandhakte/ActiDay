import 'package:actiday/ui/bookings/mobile/mobile_booking_ui.dart';
import 'package:actiday/ui/bookings/web/web_booking_ui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BookingsUi extends StatefulWidget {
  const BookingsUi({super.key});

  @override
  State<BookingsUi> createState() => _BookingsUiState();
}

class _BookingsUiState extends State<BookingsUi> {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context){
          return MobileBookingUi();
        },
       desktop: (BuildContext context){
          return WebBookingUi();
       },
    );
  }
}
