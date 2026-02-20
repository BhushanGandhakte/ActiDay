import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MobileBookingDetails extends StatefulWidget {
  const MobileBookingDetails({super.key});

  @override
  State<MobileBookingDetails> createState() => _MobileBookingDetailsState();
}

class _MobileBookingDetailsState extends State<MobileBookingDetails> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        Scaffold(
          appBar: AppBar(),
        ),
      },
    );
  }
}

