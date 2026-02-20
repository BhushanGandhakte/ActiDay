import 'package:actiday/framework/controller/favourite/favourite_control.dart';
import 'package:actiday/framework/repository/favourite/favourite_data.dart';
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WebHomeUi extends StatefulWidget {
  const WebHomeUi({super.key});

  @override
  State<WebHomeUi> createState() => _WebHomeUiState();
}

class _WebHomeUiState extends State<WebHomeUi> {


  int currentIndex = 0;
  double? screenW;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ResponsiveBuilder(
               builder: (BuildContext context, SizingInformation sizingInformation) {
                 double screenWidth = sizingInformation.screenSize.width;
                 screenW = screenWidth;
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
                                   padding: EdgeInsets.all(screenWidth * 0.005),
                                   child: AspectRatio(
                                     aspectRatio: 1600/242,
                                     child: CommonContainer(
                                         borderRadius: screenWidth * 0.02,
                                         color: AppColors.clrF0F5F9,
                                         child:ClipRRect(
                                           borderRadius: BorderRadius.circular(screenWidth * 0.01),
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
                         height: screenWidth * 0.01,
                       ),
                       Center(
                         child: SmoothPageIndicator(
                             controller: pageController,
                             count: SplashState.home!.banner!.length,
                           effect: ExpandingDotsEffect(
                             activeDotColor: AppColors.clr000000,
                             dotHeight: screenWidth * 0.004,
                             expansionFactor: screenWidth * 0.005,
                           ),
                         ),
                       ),
                       SizedBox(
                         height: screenWidth * 0.015,
                       ),
                           CommonText(
                              title:  "Royal Peace Spa",
                             fontSize: screenWidth * 0.016,
                             fontWeight: FontWeight.bold,
                           ),
                       CommonText(
                           title: "Relax and rejuvenate with the traditional Thai dry therapy Relax and rejuvenate with the",
                         fontSize: screenWidth * 0.0115,
                         fontWeight: FontWeight.w400,
                       ),
                       SizedBox(
                         height: screenWidth * 0.015,
                       ),
                       CommonText(
                         title: "Categories",
                         fontSize: screenWidth * 0.016,
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
                             padding: EdgeInsets.all(screenWidth * 0.003),
                             itemBuilder: (context, index) {
                               final item = SplashState.home?.categories![index];
                               return Padding(
                                 padding: EdgeInsets.only(right: screenWidth * 0.01),
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
                                         top: screenWidth * 0.03,
                                         left: screenWidth * 0.03,
                                         child: SizedBox(
                                           height: screenWidth * 0.05,
                                           width: screenWidth * 0.06,
                                           child: CommonText(
                                             title: item?.categoryName ?? '',
                                             color: AppColors.clrFaFaFa,
                                             fontWeight: FontWeight.bold,
                                             fontSize: screenWidth * 0.015,
                                           ),
                                         )
                                     )
                                   ],
                                 ),
                               );
                             }
                         ),
                       ),
                       SizedBox(
                         height: screenWidth * 0.015,
                       ),
                       CommonText(
                           title: "Top Classes",
                         fontSize: screenWidth * 0.016,
                         fontWeight: FontWeight.bold,
                       ),
                       SizedBox(
                         height: screenWidth * 0.015,
                       ),
                       GridView.builder(
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             mainAxisExtent: screenWidth * 0.23,
                               crossAxisCount: 3,
                           ),
                           shrinkWrap: true,
                           physics: NeverScrollableScrollPhysics(),
                           itemCount: SplashState.home?.topClass?.length,
                           itemBuilder: (context, index) {
                             final item = SplashState.home?.topClass?[index];
                             return CommonCard(
                               isHome: true,
                               height: screenWidth * 0.1,
                               screenWidth: screenWidth,
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
                       SizedBox(
                         height:  screenWidth * 0.04,
                       ),
                     ],
                   ),
                 );
               },
             ),
        ],
      ),
    );
  }
}
