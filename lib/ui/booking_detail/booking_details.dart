import 'package:actiday/ui/booking_detail/mobile/mobile_booking_details.dart';
import 'package:actiday/ui/booking_detail/web/web_booking_details.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BookingDetails extends StatefulWidget {

  final int? index;
  final bool? isUpcoming;
  final bool? isPast;

  const BookingDetails({super.key, this.index, this.isUpcoming, this.isPast});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) {
        return MobileBookingDetails(index: widget.index ?? 0, isUpcoming: widget.isUpcoming ?? false, isPast: widget.isPast ?? false);
      },
      desktop: (context) {
        return WebBookingDetails(index: widget.index ?? 0, isUpcoming: widget.isUpcoming ?? false, isPast: widget.isPast ?? false);
      },
    );
  }
}
