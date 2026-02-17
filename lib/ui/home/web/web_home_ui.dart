import 'package:actiday/framework/controller/favourite/favourite_control.dart';
import 'package:actiday/framework/repository/favourite/favourite_data.dart';
import 'package:actiday/framework/repository/home/home_data.dart';
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WebHomeUi extends StatefulWidget {
  const WebHomeUi({super.key});

  @override
  State<WebHomeUi> createState() => _WebHomeUiState();
}

class _WebHomeUiState extends State<WebHomeUi> {


  int currentIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ResponsiveBuilder(
               builder: (BuildContext context, SizingInformation sizingInformation) {
                 double screenWidth = sizingInformation.screenSize.width;
                 return Padding(
                   padding:  EdgeInsets.fromLTRB(screenWidth * 0.05, screenWidth * 0.01, screenWidth * 0.05, screenWidth * 0.01),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Center(
                         child: SizedBox(
                           height: screenWidth * 0.5 * 342/1164,
                           width: screenWidth * 0.9,
                           child: PageView.builder(
                               controller: pageController,
                               scrollDirection: Axis.horizontal,
                               itemCount: SplashState.home!.banner?.length,
                               itemBuilder: (context, index) {
                                 currentIndex = index;
                                 final item = SplashState.home!.banner;
                                 return Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: AspectRatio(
                                     aspectRatio: 1600/242,
                                     child: CommonContainer(
                                         borderRadius: 20,
                                         color: AppColors.clrf0f5f9,
                                         child:ClipRRect(
                                           borderRadius: BorderRadiusGeometry.circular(20),
                                           child:
                                           // Image.network(
                                           //   item?[index].image ?? "https://tse3.mm.bing.net/th/id/OIP.1My7WFQE3wdhA_gcvBlcZgHaEu?w=596&h=380&rs=1&pid=ImgDetMain&o=7&rm=3",
                                           //   fit: BoxFit.contain,
                                           // ),
                                           Image.asset(
                                               'assets/images/carousel.png',
                                             fit: BoxFit.fill,
                                           ),
                                         )
                                     ),
                                   ),
                                 );
                               }
                           ),
                         ),
                       ),
                       SizedBox(
                         height: 12,
                       ),
                       Center(
                         child: SmoothPageIndicator(
                             controller: pageController,
                             count: SplashState.home!.banner!.length,
                           effect: ExpandingDotsEffect(
                             activeDotColor: AppColors.clr000000,
                             dotHeight: 6,
                             expansionFactor: 7
                           ),
                         ),
                       ),
                       SizedBox(
                         height: 12,
                       ),
                           CommonText(
                              title:  "Royal Peace Spa",
                             fontSize: 24,
                             fontWeight: FontWeight.bold,
                           ),
                       CommonText(
                           title: "Relax and rejuvenate with the traditional Thai dry therapy Relax and rejuvenate with the",
                         fontWeight: FontWeight.w400,
                       ),
                       SizedBox(
                         height: screenWidth * 0.015,
                       ),
                       CommonText(
                         title: "Categories",
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                       ),
                       SizedBox(
                         height: screenWidth * 0.015,
                       ),
                       SizedBox(
                         height: screenWidth * 0.15,
                         child: ListView.builder(
                             shrinkWrap: true,
                             scrollDirection: Axis.horizontal,
                             itemCount: SplashState.home?.categories?.length,
                             padding: EdgeInsets.all(10),
                             itemBuilder: (context, index) {
                               final item = SplashState.home?.categories![index];
                               return Padding(
                                 padding: EdgeInsetsGeometry.only(right: 10),
                                 child: Stack(
                                   children: [
                                     CommonContainer(
                                       width: screenWidth * 0.442,
                                       child: AspectRatio(
                                         aspectRatio:211/568,
                                         child: Image.network(
                                           item?.image ?? '',
                                           fit: BoxFit.fill,
                                         ),
                                       ),
                                     ),
                                     Positioned(
                                         top: 10,
                                         left: 10,
                                         child: SizedBox(
                                           height: 50,
                                           width: 80,
                                           child: CommonText(
                                             title: item?.categoryName ?? '',
                                             color: AppColors.clrfafafa,
                                             fontWeight: FontWeight.bold,
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
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                       ),
                       SizedBox(
                         height: screenWidth * 0.015,
                       ),
                       GridView.builder(
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             mainAxisExtent: 300,
                               crossAxisCount: 3,
                           ),
                           shrinkWrap: true,

                           physics: NeverScrollableScrollPhysics(),
                           itemCount: SplashState.home?.topClass?.length,
                           itemBuilder: (context, index) {
                             final item = SplashState.home?.topClass?[index];
                             return CommonCard(
                               imgSrc: "https://images.pexels.com/photos/4853705/pexels-photo-4853705.jpeg",
                               title: item?.title,
                               subTitle: item?.subTitle,
                               address: item?.address,
                               rating: item?.rating,
                               isFavourite: item?.isFavourite,
                               height: 150,
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
                       SizedBox(
                         height: 50,
                       ),
                     ],
                   ),
                 );
               },
             ),
          Container(
            height: 100,
            color: AppColors.clr000000,
            child: Row(
              children: [
                CommonText(
                  title:  "  Copyright @ 2020-2022 Dreamplug Technologies Pvt. Ltd.",
                  color: AppColors.clrfafafa,
                ),
                Spacer(),
                CommonText(
                  title: "Privacy Policy  |  terms and conditions  |  returns and refund  ",
                  color: AppColors.clrfafafa,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
