import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {

  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const CommonText({super.key, required this.title, this.fontSize, this.fontWeight, this.color, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
