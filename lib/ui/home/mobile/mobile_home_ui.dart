import 'package:actiday/framework/controller/favourite/favourite_control.dart';
import 'package:actiday/framework/repository/favourite/favourite_data.dart';
import 'package:actiday/ui/splash/splash.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_card.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 44,
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CommonText(
                          title: "yoga, pilates, massage",
                          fontSize: 12,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                      itemCount: SplashState.home!.banner?.length,
                      itemBuilder: (context, index) {
                      currentIndex = index;
                      final item = SplashState.home!.banner;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CommonContainer(
                            height: 350,
                            width: 330,
                            borderRadius: 20,
                            color: AppColors.clrF0F5F9,
                            child:Image.network(
                              item?[index].image ?? "https://tse3.mm.bing.net/th/id/OIP.1My7WFQE3wdhA_gcvBlcZgHaEu?w=596&h=380&rs=1&pid=ImgDetMain&o=7&rm=3",
                              fit: BoxFit.contain,
                            )
                          ),
                        );
                      }
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                    CommonText(
                        title: "Active Lifestyle",
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: CommonText(
                        title: "Get active every day. Try new things. Find new classes",
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                CommonText(
                    title: "Categories",
                ),
                    
                  SizedBox(
                    height: 100,
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
                                  height: 103,
                                  width: 160,
                                  child: Image.network(
                                      item?.image ?? '',
                                    fit: BoxFit.fill,
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
                                        color: AppColors.clrFaFaFa,
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
                CommonText(title: "Top Classes"),
                   ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: SplashState.home?.topClass?.length,
                       itemBuilder: (context, index) {
                       final item = SplashState.home?.topClass?[index];
                         return CommonCard(
                           height: 270,
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
                                     // FavouriteData(
                                     //   title: item?.title ?? 'NA',
                                     //   imgSrc: "https://images.pexels.com/photos/4853705/pexels-photo-4853705.jpeg",
                                     //   address: item?.address ?? 'NA',
                                     //   rating: item?.rating ?? 3,
                                     //   isFavourite: false,
                                     //   index: index,
                                     // )
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
        ),
    );
  }
}
