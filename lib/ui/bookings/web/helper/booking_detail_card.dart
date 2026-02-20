import 'package:flutter/material.dart';

class BookingDetailCard extends StatefulWidget {

  final double? screenWidth;

  const BookingDetailCard({super.key, this.screenWidth});

  @override
  State<BookingDetailCard> createState() => _BookingDetailCardState();
}

class _BookingDetailCardState extends State<BookingDetailCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget?.screenWidth * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/home.svg',
                    height: screenWidth * 0.02,
                    width: screenWidth * 0.02,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: screenWidth * 0.01,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: CommonText(
                      title: "Booking",
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.012,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: screenWidth * 0.01,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  CommonText(
                    title: "Booking Details",
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.012,
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.015),
              CommonText(
                title: "Booking Details",
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.015,
              ),
              SizedBox(height: screenWidth * 0.015),
              CommonContainer(
                borderRadius: 20,
                height: screenWidth * 0.2,
                width: screenWidth * 0.6,
                color: AppColors.clrF0F5F9,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/booking.png',
                            height: screenWidth * 0.08,
                            width: screenWidth * 0.1,
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                title: item?.title ?? 'NA',
                                fontSize: 18,
                              ),
                              SizedBox(
                                height: screenWidth * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                  ),
                                  CommonText(
                                    title: item?.address ?? 'NA',
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.01,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    size: screenWidth * 0.005,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.01,
                                  ),
                                  Icon(Icons.star),
                                  CommonText(
                                    title: "${item?.rating}",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CommonText(
                                    title: item?.category ?? 'NA',
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.445,
                                  ),
                                  CommonText(
                                    title:
                                    "${item?.credit} Credit",
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenWidth * 0.006,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time_rounded),
                                  SizedBox(
                                    width: screenWidth * 0.005,
                                  ),
                                  CommonText(
                                    title: item?.time ?? 'NA',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenWidth * 0.006,
                              ),
                              Row(
                                children: [
                                  CommonText(title: 'Specialist'),
                                  SizedBox(
                                    width: screenWidth * 0.45,
                                  ),
                                  CommonText(
                                    title:
                                    item?.specialist ?? 'NA',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenWidth * 0.006,
                              ),
                              Row(
                                children: [
                                  CommonText(title: "Time Slot"),
                                  SizedBox(
                                    width: screenWidth * 0.41,
                                  ),
                                  CommonText(
                                    title: item?.timeSlot ?? 'NA',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              CommonText(
                title: "Payment Summary",
                fontSize: screenWidth * 0.015,
              ),
              SizedBox(height: screenWidth * 0.01),
              CommonContainer(
                borderRadius: 20,
                height: screenWidth * 0.1,
                width: screenWidth * 0.6,
                color: AppColors.clrF0F5F9,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          CommonText(title: "Booking Total"),
                          SizedBox(width: screenWidth * 0.445),
                          CommonText(
                            title: "${item?.credit} Credit",
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          CommonText(title: "Order Total"),
                          SizedBox(width: screenWidth * 0.445),
                          CommonText(
                            title: "${item?.credit} Credit",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Column(
                  children: (widget.isUpcoming == false ) ? [
                    CommonText(title: "Write Your Reviews"),
                    SizedBox(height: screenWidth * 0.03),
                    CommonContainer(
                      height: screenWidth * 0.1,
                      width: screenWidth * 0.6,
                      borderRadius: 20,
                      color: AppColors.clrF0F5F9,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: TextFormField(
                          minLines: null,
                          maxLines: null,
                          expands: true,
                          cursorColor : AppColors.clr808080,
                          decoration: InputDecoration(
                            hint: CommonText(
                              title: "Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry's Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took A Galley Of Type And Scrambled It To Make A Type Specimen Book.",
                            ),
                            hintStyle : TextStyle(
                              color: AppColors.clr808080,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ] : [
                    CommonText(
                      title:  "You can cancel an appointment minimum of 30 minutes prior to the scheduled time.",
                    )
                  ]
              ),
              SizedBox(height: screenWidth * 0.03),
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    widget.isPast == true
                        ? AppColors.clrF048c6
                        : Colors.transparent,
                  ),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.fromLTRB(
                      screenWidth * 0.02,
                      screenWidth * 0.015,
                      screenWidth * 0.02,
                      screenWidth * 0.015,
                    ),
                  ),
                ),
                onPressed: () {},
                child: CommonText(
                  title: widget.isUpcoming == true
                      ? "Cancel Booking"
                      : "Submit",
                ),
              ),
            ],
          ),
          SizedBox(width: screenWidth * 0.1),
          if(widget.isUpcoming == false)
            Column(
              children:  [
                CommonContainer(
                  height: screenWidth * 0.35,
                  width: screenWidth * 0.2,
                  borderRadius: 20,
                  color: AppColors.clrF0F5F9,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.025),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(title: "Rate Us"),
                        SizedBox(height: screenWidth * 0.03),
                        RatingWidget(screenWidth: screenWidth, rating: "1", comment: "Bad"),
                        RatingWidget(screenWidth: screenWidth, rating: "2", comment: "Better"),
                        RatingWidget(screenWidth: screenWidth, rating: "3", comment: "Good"),
                        RatingWidget(screenWidth: screenWidth, rating: "4", comment: "Very Good"),
                        RatingWidget(screenWidth: screenWidth, rating: "5", comment: "Excellent"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth * 0.16,
                )
              ],
            ),
        ],
      ),
    ),;
  }
}
