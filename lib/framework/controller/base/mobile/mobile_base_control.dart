import 'package:actiday/ui/bookings/mobile/mobile_booking_ui.dart';
import 'package:actiday/ui/explore/mobile/mobile_explore_ui.dart';
import 'package:actiday/ui/favourite/mobile/mobile_favourite_ui.dart';
import 'package:actiday/utils/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:actiday/framework/repository/base/mobile/mobile_base_data.dart';
import 'package:actiday/ui/home/mobile/mobile_home_ui.dart';
import 'package:flutter_svg/svg.dart';

class MobileBaseControl {

  static List<MobileBaseData> appBarData = [
    MobileBaseData(
      drawerImg: SvgPicture.asset('assets/mobile/drawer_logo.svg'),
      location: Icon(Icons.location_on_outlined),
      title: "Abu Dhabi, UAE",
      notification: Icon(Icons.notifications_none_rounded),
    ),
    MobileBaseData(
      drawerImg: SvgPicture.asset('assets/mobile/drawer_logo.svg'),
      title: "My Bookings",
    )
  ];

  static List<MobileBaseData> bottomMenuData = [
    MobileBaseData(
      iconName: BottomNavItems.Home.name,
      icon: Icon(Icons.home_filled),
      screenName: MobileHomeUi(),
    ),
    MobileBaseData(
      iconName: BottomNavItems.Bookings.name,
      icon: Icon(Icons.calendar_month_sharp),
      screenName: MobileBookingUi(),
    ),
    MobileBaseData(
      iconName: BottomNavItems.Explore.name,
      icon: Icon(Icons.explore),
      screenName: MobileExploreUi(),
    ),
    MobileBaseData(
      iconName: BottomNavItems.Favourite.name,
      icon: Icon(Icons.favorite_outline),
      screenName: MobileFavouriteUi(),
    ),

  ];

}
