
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:flutter/material.dart';

class WebUpcoming extends StatefulWidget {

  final double screenWidth;
  const WebUpcoming({super.key, required this.screenWidth});

  @override
  State<WebUpcoming> createState() => _WebUpcomingState();
}

class _WebUpcomingState extends State<WebUpcoming> {

  @override
  Widget build(BuildContext context) {
    print("Count ${SplashState.bookings?.upcoming?.length}");

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: SplashState.bookings?.upcoming?.length,
      itemBuilder: (context, index) {
        final item = SplashState.bookings?.upcoming?[index];
        return CommonCard(
          screenWidth: widget.screenWidth,
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
