import 'package:actiday/ui/bookings/web/web_booking_details.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CommonCard extends StatefulWidget {

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
  final bool? isUpcoming;
  final bool? isPast;

  const CommonCard({super.key, this.imgSrc, this.title, this.subTitle, this.address, this.rating, this.height, this.width, this.isFavourite, this.onTap, this.bookSubTitle, this.date, this.credit, this.id, this.isUpcoming = false, this.isPast, this.index = 0,});

  @override
  State<CommonCard> createState() => CommonCardState();
}

class CommonCardState extends State<CommonCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CommonContainer(
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
                            width: (widget.isUpcoming == true || widget.isPast == true) ? 256 : 340,
                            child: (widget.isUpcoming == true || widget.isPast == true) ?  CommonText(
                                title: widget.bookSubTitle?.join(" . ") ?? 'NA',
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                            ) : CommonText(
                              title:  widget.subTitle ?? 'NA',
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: (widget.isUpcoming == true || widget.isPast == true) ? [
                              CommonText(title: DateFormat(
                                'dd MMM yyyy, hh:mm a',
                              ).format(widget.date!)
                              ),
                            ] : [
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
                      Column(
                        children: [
                          (widget.isUpcoming == true || widget.isPast ==  true) ? CommonText(
                            title: "${widget.credit} Credit",
                            fontWeight: FontWeight.bold,
                          ) : Row(
                            children: [
                              CommonText(
                                title: "${widget.rating}",
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: AppColors.clrf048c6,
                              ),
                            ],
                          ) ,
                          SizedBox(
                            height: 30,
                          ),
                          if(widget.isUpcoming == true || widget.isPast == true)
                            OutlinedButton(
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(8, 4, 8, 4))
                              ),
                              onPressed: (){
                                print(widget.index);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> WebBookingDetails(index: widget.index, isUpcoming: widget.isUpcoming ?? true, isPast : widget.isPast ?? true)));
                              },
                              child: CommonText(
                                  title: (widget.isUpcoming == true) ? "Booked" : "Completed",
                                fontSize: 12,
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
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
