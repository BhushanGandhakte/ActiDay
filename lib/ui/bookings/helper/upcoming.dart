import 'package:actiday/framework/repository/bookings/bookings_data.dart';
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'helper.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {

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
