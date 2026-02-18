import 'package:actiday/ui/login/mobile/mobile_login.dart';
import 'package:actiday/ui/login/web/web_login.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context){
        return MobileLogin();
      },
      desktop: (context){
        return WebLogin();
      },
    );
  }
}
