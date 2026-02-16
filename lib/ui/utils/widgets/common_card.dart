import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonCard extends StatefulWidget {

  final String? imgSrc;
  final String? title;
  final String? subTitle;
  final String? id;
  final List<String>? bookSubTitle;
  final String? date;
  final int? credit;
  final String? address;
  final int? rating;
  final double? height;
  final double? width;
  final bool? isFavourite;
  final Function()? onTap;

  const CommonCard({super.key, this.imgSrc, this.title, this.subTitle, this.address, this.rating, this.height, this.width, this.isFavourite, this.onTap, this.bookSubTitle, this.date, this.credit, this.id,});

  @override
  State<CommonCard> createState() => CommonCardState();
}

class CommonCardState extends State<CommonCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CommonContainer(
        width: widget.width,
        borderRadius: 15,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: widget.height,
                  width: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                    child: Image.network(
                      widget.imgSrc ?? 'NA',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace){
                        return Image.network('https://images.pexels.com/photos/4853705/pexels-photo-4853705.jpeg');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            title: widget.title ?? 'NA',
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 280,
                            child: CommonText(
                              title: widget.subTitle ?? 'NA',
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.clr808080,
                              ),
                              CommonText(
                                title: widget.address ?? 'NA',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.clr808080,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      widget.credit == null ?
                      CommonText(
                        title: "${widget.rating}",
                      ) : CommonText(title: "${widget.credit}"),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: AppColors.clrf048c6,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: isFavourite(widget.isFavourite),
                )
            )
          ]
        ),
      ),
    );
  }

  static Widget? isFavourite(bool? isFav) {
    if(isFav == false){
      return SvgPicture.asset(AppAssets.notFav);
    }
    return SvgPicture.asset(AppAssets.isFav);
  }

}
