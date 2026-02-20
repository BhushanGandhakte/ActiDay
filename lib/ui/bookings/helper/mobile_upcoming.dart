
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:flutter/material.dart';

class MobileUpcoming extends StatefulWidget {

  final double screenWidth;
  final double height;

  const MobileUpcoming({super.key, required this.screenWidth, required this.height});

  @override
  State<MobileUpcoming> createState() => _MobileUpcomingState();
}

class _MobileUpcomingState extends State<MobileUpcoming> {

  @override
  Widget build(BuildContext context) {
    print("Count ${SplashState.bookings?.upcoming?.length}");

    return ListView.builder(
      itemCount: SplashState.bookings?.upcoming?.length,
      itemBuilder: (context, index) {
        final item = SplashState.bookings?.upcoming?[index];
        return CommonCard(
          screenWidth: widget.screenWidth,
          height: widget.height,
          index: index,
          isUpcoming: true,
          id: item?.id,
          imgSrc: item?.image,
          title: item?.title,
          bookSubTitle: item?.subTitle,
          date: item?.date != null
              ? DateTime.fromMillisecondsSinceEpoch(int.parse(item!.date!))
              : null,
          credit: item?.credit,
        );
      },
    );
  }
}
