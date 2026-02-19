import 'package:actiday/framework/controller/favourite/favourite_control.dart';
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WebFavouriteUi extends StatefulWidget {
  const WebFavouriteUi({super.key});

  @override
  State<WebFavouriteUi> createState() => _WebFavouriteUiState();
}

class _WebFavouriteUiState extends State<WebFavouriteUi> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        return Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/home.svg',
                    height: screenWidth * 0.02,
                    width: screenWidth * 0.02,
                  ),
                  SizedBox(
                    width: screenWidth * 0.015,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                  SizedBox(
                    width: screenWidth * 0.015,
                  ),
                  CommonText(
                    title: "Favourite",
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.015,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CommonText(
                title: "Favourite",
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              SizedBox(
                height: 20,
              ),
              FavouriteControl.favList.isEmpty ? Center(
                  child: CommonText(
                    title: "No Favourite",
                    fontSize: 20,
                  )
              ) :
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3
                ),
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
                },
              ),
            ],
          ),
        );
      },
    );
  }
}