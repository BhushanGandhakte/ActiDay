
import 'package:actiday/framework/repository/bookings/bookings_data.dart';
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

  static Welcome? welcome;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadWelcomeJson().then((_){
      if(mounted) setState(() {});
    });
  }

  Future<void> loadWelcomeJson() async {

    final String response =
    await rootBundle.loadString('assets/json/bookings.json');

    final data = welcomeFromJson(response);

    setState(() {
      welcome = data;
    });
  }

  @override
  Widget build(BuildContext context) {

    print("Count ${welcome?.upcoming?.length}");

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3
        ),
        itemCount: welcome?.upcoming?.length,
        itemBuilder: (context, index){
          final item = welcome?.upcoming?[index];
          return CommonCard(
            id: item?.id,
            imgSrc: item?.image,
            title: item?.title,
            bookSubTitle: item?.subTitle,
            date: item?.date,
            credit: item?.credit,
          );
        }
    );
  }
}
