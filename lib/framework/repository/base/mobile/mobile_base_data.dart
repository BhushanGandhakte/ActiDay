import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileBaseData{
  final String? iconName;
  final Icon? icon;
  final Widget? screenName;

  final SvgPicture? drawerImg;
  final Icon? location;
  final String? title;
  final String? locName;
  final Icon? notification;

  const MobileBaseData({
    this.iconName,
    this.screenName,
    this.icon,
    this.drawerImg,
    this.location,
    this.title,
    this.locName,
    this.notification
  });

}