import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {

  final double screenWidth;
  final String rating;
  final String comment;

  const RatingWidget({super.key, required this.screenWidth, required this.rating, required this.comment});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(
                      widget.screenWidth * 0.0125, widget.screenWidth * 0.0125, widget.screenWidth * 0.0125, widget.screenWidth * 0.0125
                  ),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
              ),
              child: Row(
                children: [
                  CommonText(title: widget.rating),
                  SizedBox(width: widget.screenWidth * 0.005),
                  Icon(
                      Icons.star,
                    color: AppColors.clrF048c6,
                  )
                ],
              ),
              onPressed: () {

              },
            ),
            SizedBox( width: widget.screenWidth * 0.03,),
            CommonText(title: widget.comment),
          ],
        ),
        SizedBox(height: widget.screenWidth * 0.02),
      ],
    );
  }
}
