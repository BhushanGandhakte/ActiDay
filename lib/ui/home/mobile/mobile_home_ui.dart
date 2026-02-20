import 'package:actiday/framework/controller/favourite/favourite_control.dart';
import 'package:actiday/framework/repository/favourite/favourite_data.dart';
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../utils/theme/app_assets.dart';
import '../../utils/widgets/common_container.dart';

class MobileHomeUi extends StatefulWidget {

  const MobileHomeUi({super.key});

  @override
  State<MobileHomeUi> createState() => _MobileHomeUiState();
}

class _MobileHomeUiState extends State<MobileHomeUi> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(14,4, 16, 0),
          child: SvgPicture.asset(AppAssets.drawerLogo),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16,
            ),
            CommonText(
                title: "Abu Dhabi, UAE",
                fontSize: 16
            )
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 26,
            ),
          )
        ],
      ),
        body: ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: screenWidth * 0.15,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenWidth * 0.05),
                            border: Border.all(color: Colors.grey, width: 0.5)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.015,
                              ),
                              Icon(
                                Icons.search,
                              ),
                              SizedBox(
                                width: screenWidth * 0.015,
                              ),
                              CommonText(
                                title: "yoga, pilates, massage",
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w400,
                                color: AppColors.clr808080,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.06,
                    ),
                    SizedBox(
                      height: screenWidth * 0.45,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: SplashState.home!.banner?.length,
                          itemBuilder: (context, index) {
                            currentIndex = index;
                            final item = SplashState.home!.banner;
                            return Padding(
                              padding: EdgeInsets.all(screenWidth * 0.01,),
                              child: CommonContainer(
                                  height: screenWidth * 0.6,
                                  width: screenWidth * 0.87,
                                  borderRadius: 20,
                                  color: AppColors.clrF0F5F9,
                                  child:Image.asset(
                                      "assets/images/carousel.png",
                                    fit: BoxFit.fill,
                                  ),
                              ),
                            );
                          }
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02
                    ),
                    CommonText(
                      title: "Active Lifestyle",
                      fontSize: screenWidth * 0.05,
                    ),
                    SizedBox(
                      height: screenWidth * 0.1,
                      width: screenWidth * 0.6,
                      child: CommonText(
                        title: "Get active every day. Try new things. Find new classes",
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    SizedBox(
                        height: screenWidth * 0.03
                    ),
                    CommonText(
                      title: "Categories",
                      fontSize: screenWidth * 0.05,
                    ),
                    SizedBox(
                        height: screenWidth * 0.03
                    ),
                    SizedBox(
                      height: screenWidth * 0.4,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: SplashState.home?.categories?.length,
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          itemBuilder: (context, index) {
                            final item = SplashState.home?.categories![index];
                            return Padding(
                              padding: EdgeInsets.only(right: screenWidth * 0.03),
                              child: Stack(
                                children: [
                                  CommonContainer(
                                    height: screenWidth * 0.3,
                                    width: screenWidth * 0.42,
                                    child: Image.network(
                                      item?.image ?? '',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                      top: screenWidth * 0.03,
                                      left: screenWidth * 0.03,
                                      child: SizedBox(
                                        height: screenWidth * 0.2,
                                        width: screenWidth * 0.2,
                                        child: CommonText(
                                          title: item?.categoryName ?? '',
                                          color: AppColors.clrFaFaFa,
                                          fontWeight: FontWeight.bold,
                                          fontSize : screenWidth * 0.05,
                                        ),
                                      )
                                  )
                                ],
                              ),
                            );
                          }
                      ),
                    ),
                    CommonText(
                        title: "Top Classes",
                      fontSize: screenWidth * 0.05,
                    ),
                    SizedBox(
                        height: screenWidth * 0.03
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: SplashState.home?.topClass?.length,
                        itemBuilder: (context, index) {
                          final item = SplashState.home?.topClass?[index];
                          return CommonCard(
                            isHome: true,
                            screenWidth: screenWidth * 3,
                            height: screenWidth * 0.4,
                            imgSrc: "https://images.pexels.com/photos/4853705/pexels-photo-4853705.jpeg",
                            title: item?.title,
                            subTitle: item?.subTitle,
                            address: item?.address,
                            rating: item?.rating,
                            isFavourite: item?.isFavourite,
                            onTap: (){
                              setState(() {
                                if(item?.isFavourite == false){
                                  FavouriteControl.favList.add(
                                      FavouriteData(
                                        title: item?.title ?? 'NA',
                                        imgSrc: "https://images.pexels.com/photos/4853705/pexels-photo-4853705.jpeg",
                                        address: item?.address ?? 'NA',
                                        rating: item?.rating ?? 3,
                                        isFavourite: true,
                                        index: index,
                                      )
                                  );
                                  item?.isFavourite = true;
                                  print("added");
                                  print(item?.isFavourite);
                                }else {
                                  FavouriteControl.favList.removeWhere(
                                        (item)=> item.index == index,
                                  );
                                  item?.isFavourite = false;
                                  print("removed");
                                  print(item?.isFavourite);
                                  print(FavouriteControl.favList);
                                }
                                CommonCardState.isFavourite(item?.isFavourite);
                              });
                              print("clicked");
                            },
                          );
                        }
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}
