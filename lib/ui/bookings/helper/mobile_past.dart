import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:flutter/material.dart';


class MobilePast extends StatefulWidget {
  const MobilePast({super.key});
  @override
  State<MobilePast> createState() => _MobilePastState();
}

class _MobilePastState extends State<MobilePast> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
