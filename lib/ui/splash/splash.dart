import 'package:actiday/ui/splash/mobile/mobile_splash.dart';
import 'package:actiday/ui/splash/web/web_splash.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();

}

class _SplashState extends State<Splash> {

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
