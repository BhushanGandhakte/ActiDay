import 'package:actiday/ui/favourite/mobile/mobile_favourite_ui.dart';
import 'package:actiday/ui/favourite/web/web_favourite_ui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FavouriteUi extends StatefulWidget {
  const FavouriteUi({super.key});

  @override
  State<FavouriteUi> createState() => _FavouriteUiState();
}

class _FavouriteUiState extends State<FavouriteUi> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context){
        return MobileFavouriteUi();
      },
      desktop: (context){
        return WebFavouriteUi();
      },
    );
  }
}
