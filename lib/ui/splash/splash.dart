import 'package:actiday/framework/repository/bookings/bookings_data.dart';
import 'package:actiday/framework/repository/home/home_data.dart';
import 'package:actiday/ui/splash/mobile/mobile_splash.dart';
import 'package:actiday/ui/splash/web/web_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();

}

class SplashState extends State<Splash> {

  static HomeData? home;
  static BookingsData? bookings;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadHomeJson();
    loadBookingsDataJson();
  }

  Future<void> loadHomeJson() async {

    final String response =
    await rootBundle.loadString('assets/json/home.json');

    final data = homeFromJson(response);

    setState(() {
      home = data;
    });
  }

  Future<void> loadBookingsDataJson() async {

    final String response =
    await rootBundle.loadString('assets/json/bookings.json');

    final data = bookingsDataFromJson(response);

    setState(() {
      bookings = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return MobileSplash();
      },
      desktop: (BuildContext context){
        return  WebSplash();
      },
    );
  }
}
