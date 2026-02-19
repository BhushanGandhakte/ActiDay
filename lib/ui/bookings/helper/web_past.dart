import 'package:actiday/framework/repository/bookings/bookings_data.dart';
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'helper.dart';

class WebPast extends StatefulWidget {
  const WebPast({super.key});
  @override
  State<WebPast> createState() => _WebPastState();
}

class _WebPastState extends State<WebPast> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,

        ),
        itemCount: SplashState.bookings?.past?.length,
        itemBuilder: (context, index){
          final item = SplashState.bookings?.past?[index];
          return CommonCard(
            index: index,
            isPast: true,
            id: item?.id,
            imgSrc: item?.image,
            title: item?.title,
            bookSubTitle: item?.subTitle,
            date: item?.date != null
                ? DateTime.fromMillisecondsSinceEpoch(int.parse(item!.date!))
                : null,
            credit: item?.credit,
          );
        }
    );
  }
}
