import 'dart:async';
import 'package:actiday/ui/login/login.dart';
import 'package:actiday/ui/splash/helper/common_splash_img.dart';
import 'package:flutter/material.dart';


class MobileSplash extends StatefulWidget {
  const MobileSplash({super.key});

  @override
  State<MobileSplash> createState() => _MobileSplashState();

}

class _MobileSplashState extends State<MobileSplash> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            ()=> Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login())
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonSplashImg(imgHeight: 145, imgWidth: 135),
      ),
    );
  }
}
