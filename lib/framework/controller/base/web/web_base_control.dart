import 'package:actiday/ui/bookings/bookings_ui.dart';
import 'package:actiday/ui/bookings/web/web_booking_ui.dart';
import 'package:actiday/ui/explore/explore_ui.dart';
import 'package:actiday/ui/explore/web/web_explore_ui.dart';
import 'package:actiday/ui/favourite/favourite_ui.dart';
import 'package:actiday/ui/favourite/web/web_favourite_ui.dart';
import 'package:actiday/ui/home/home_ui.dart';
import 'package:actiday/ui/home/web/web_home_ui.dart';
import 'package:flutter/material.dart';
import 'package:actiday/framework/repository/base/web/web_base_data.dart';
import 'package:actiday/ui/utils/app_enums.dart';

class WebBaseControl {

  static List<WebBaseData> appBarMenuData = [
    WebBaseData(
      iconName: BottomNavItems.Home.name,
      icon: Icon(Icons.home_filled),
      screenName: HomeUi(),
      index: 0
    ),
    WebBaseData(
      iconName: BottomNavItems.Bookings.name,
      icon: Icon(Icons.calendar_month_sharp),
      screenName: BookingsUi(),
      index: 1
    ),
    WebBaseData(
      iconName: BottomNavItems.Explore.name,
      icon: Icon(Icons.explore),
      screenName: ExploreUi(),
      index: 2
    ),
    WebBaseData(
      iconName: BottomNavItems.Favourite.name,
      icon: Icon(Icons.favorite_outline),
      screenName: FavouriteUi(),
      index: 3
    ),

  ];

}
