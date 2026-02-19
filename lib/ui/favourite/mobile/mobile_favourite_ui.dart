import 'package:actiday/framework/controller/favourite/favourite_control.dart';
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MobileFavouriteUi extends StatefulWidget {
  const MobileFavouriteUi({super.key});

  @override
  State<MobileFavouriteUi> createState() => _MobileFavouriteUiState();
}

class _MobileFavouriteUiState extends State<MobileFavouriteUi> {


  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         leading: Padding(
           padding: const EdgeInsets.fromLTRB(14,4, 16, 0),
           child: SvgPicture.asset(AppAssets.drawerLogo),
         ),
         title: CommonText(
             title: "My Favourite",
           fontSize: 18,
         ),
         centerTitle: true,
       ),
      body: FavouriteControl.favList.isEmpty ? Center(
          child: CommonText(
            title: "No Favourite",
            fontSize: 20,
          )
      ) : ListView.builder(
        shrinkWrap: true,
        itemCount: FavouriteControl.favList.length,
          itemBuilder: (context, index) {
            final item = FavouriteControl.favList[index];
            final itemMain = SplashState.home?.topClass?[item.index];
            return CommonCard(
              height: 270,
              imgSrc: item.imgSrc,
              title: item.title,
              address: item.address,
              rating: item.rating,
              onTap: (){
                setState(() {
                  print(itemMain?.isFavourite);
                  print(item.isFavourite);
                  if(item.isFavourite == true){
                    print("true");
                    FavouriteControl.favList.removeAt(index);
                    itemMain?.isFavourite = false;
                  }
                  CommonCardState.isFavourite(itemMain?.isFavourite);
                });
                print(FavouriteControl.favList);
              },
            );
          }
      ),
    );
  }
}

