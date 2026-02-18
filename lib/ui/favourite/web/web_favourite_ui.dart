import 'package:actiday/framework/controller/favourite/favourite_control.dart';
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WebFavouriteUi extends StatefulWidget {
  const WebFavouriteUi({super.key});

  @override
  State<WebFavouriteUi> createState() => _WebFavouriteUiState();
}

class _WebFavouriteUiState extends State<WebFavouriteUi> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                    'assets/svg/home.svg',
                  height: 24,
                  width: 24,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                    Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
                SizedBox(
                  width: 20,
                ),
                CommonText(
                    title: "Favourite",
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
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
            Expanded(
              child: GridView.builder(
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
            ),
          ],
        ),
      );
  }
}