import 'dart:async';
import 'package:actiday/ui/base/mobile/mobile_base_ui.dart';
import 'package:actiday/ui/splash/helper/common_splash_img.dart';
import 'package:flutter/material.dart';

import '../../base/base_ui.dart';

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
                MaterialPageRoute(builder: (context) => BaseUi())
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
