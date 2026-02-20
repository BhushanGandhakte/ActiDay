import 'package:actiday/ui/bookings/web/web_booking_details.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class CommonCard extends StatefulWidget {

  final double screenWidth;
  final int index;
  final String? imgSrc;
  final String? title;
  final String? subTitle;
  final String? id;
  final List<String>? bookSubTitle;
  final DateTime? date;
  final int? credit;
  final String? address;
  final int? rating;
  final double? height;
  final double? width;
  final bool? isFavourite;
  final Function()? onTap;
  final bool isUpcoming;
  final bool isPast;
  final bool isHome;

  const CommonCard({super.key, this.imgSrc, this.title, this.subTitle, this.address, this.rating, this.height, this.width, this.isFavourite, this.onTap, this.bookSubTitle, this.date, this.credit, this.id, this.isUpcoming = false, this.isPast = false, this.index = 0, this.screenWidth = 700, this.isHome = false,});

  @override
  State<CommonCard> createState() => CommonCardState();
}

class CommonCardState extends State<CommonCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.screenWidth * 0.01),
      child: CommonContainer(
        borderRadius: widget.screenWidth * 0.015,
        height: widget.screenWidth * 0.25,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: widget.height,
                  width: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(widget.screenWidth * 0.015), topLeft: Radius.circular(widget.screenWidth * 0.015)),
                    child: Image.network(
                      widget.imgSrc ?? 'NA',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace){
                        return Image.network(
                            'https://images.pexels.com/photos/4853705/pexels-photo-4853705.jpeg',
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(widget.screenWidth * 0.01),
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
                            width: (widget.isUpcoming == true || widget.isPast == true) ? widget.screenWidth * 0.2 : widget.screenWidth * 0.235,
                            child: (widget.isUpcoming == true || widget.isPast == true) ?  CommonText(
                                title: widget.bookSubTitle?.join(" . ") ?? 'NA',
                              fontWeight: FontWeight.w300,
                              fontSize: widget.screenWidth * 0.012,
                            ) : CommonText(
                              title:  widget.subTitle ?? 'NA',
                              fontWeight: FontWeight.w400,
                              fontSize: widget.screenWidth * 0.0115,
                            ),
                          ),
                          SizedBox(
                            height: widget.screenWidth * 0.011,
                          ),
                          Row(
                            children: (widget.isUpcoming == true || widget.isPast == true) ? [
                              CommonText(
                                title: DateFormat(
                                'dd MMM yyyy, hh:mm a',
                              ).format(widget.date!),
                                fontSize: widget.screenWidth * 0.012,
                              ),
                            ] : [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.clr808080,
                                size: widget.screenWidth * 0.0175,
                              ),
                              CommonText(
                                title: widget.address ?? 'NA',
                                fontWeight: FontWeight.w400,
                                fontSize: widget.screenWidth * 0.011,
                                color: AppColors.clr808080,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          (widget.isUpcoming == true || widget.isPast ==  true) ? CommonText(
                            title: "${widget.credit} Credit",
                            fontWeight: FontWeight.bold,
                          ) : Row(
                            children: [
                              CommonText(
                                title: "${widget.rating}",
                                fontSize: widget.screenWidth * 0.0145,
                              ),
                              Icon(
                                Icons.star,
                                size: widget.screenWidth * 0.0145,
                                color: AppColors.clrF048c6,
                              ),
                            ],
                          ) ,
                          SizedBox(
                            height: widget.screenWidth * 0.025,
                          ),
                          if(widget.isUpcoming == true || widget.isPast == true)
                            OutlineGradientButton(
                              gradient: AppColors.clrGradient,
                              padding: EdgeInsets.fromLTRB(widget.screenWidth * 0.015, widget.screenWidth * 0.005, widget.screenWidth * 0.015, widget.screenWidth * 0.005),
                              radius: Radius.circular(20),
                              onTap: (){
                                print(widget.index);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> WebBookingDetails(index: widget.index, isUpcoming: widget.isUpcoming ?? true, isPast : widget.isPast ?? true)));
                              },
                              strokeWidth: 1,
                              child: CommonText(
                                  title: (widget.isUpcoming == true) ? "Booked" : "Completed",
                                fontSize: widget.screenWidth * 0.0125,
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if(widget.isHome == true)
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
