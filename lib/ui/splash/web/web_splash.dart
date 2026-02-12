import 'dart:async';

import 'package:actiday/ui/base/web/web_base_ui.dart';
import 'package:actiday/ui/splash/helper/common_splash_img.dart';
import 'package:flutter/material.dart';

import '../../base/base_ui.dart';

class WebSplash extends StatefulWidget {
  const WebSplash({super.key});

  @override
  State<WebSplash> createState() => _WebSplashState();
}

class _WebSplashState extends State<WebSplash> {

  @override
  void initState(){
    super.initState();
    Timer(
        Duration(seconds: 3),
            ()=> Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context)=> BaseUi())
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonSplashImg(imgHeight: 180, imgWidth: 180),
      ),
    );
  }
}
