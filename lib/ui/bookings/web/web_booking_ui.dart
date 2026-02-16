import 'package:actiday/framework/repository/bookings/bookings_data.dart' hide Past;
import 'package:actiday/ui/bookings/helper/upcoming.dart';
import 'package:actiday/ui/bookings/helper/past.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WebBookingUi extends StatefulWidget {
  const WebBookingUi({super.key});

  @override
  State<WebBookingUi> createState() => _WebBookingUiState();
}

class _WebBookingUiState extends State<WebBookingUi> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(
          children: [
          SvgPicture.asset(
            'assets/svg/home.svg',
            height: 24,
            width: 24,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
          ),
          SizedBox(
            width: 20,
          ),
          CommonText(
            title: "Bookings",
            fontWeight: FontWeight.bold,
            fontSize: 12,
          )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        CommonText(
          title: "Bookings",
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        SizedBox(
          height: 20,
        ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: AppColors.clr808080,
                        tabs: [
                          CommonText(title: "Upcoming"),
                          CommonText(title: "Past")
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          Upcoming(),
                          Past()
                        ]),
                      ),
                    ],
                  ),
                ),
              ),      
    ]
    )
        )
    );
  }
}
