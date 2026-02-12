import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {

  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CommonText({super.key, required this.title, this.fontSize, this.fontWeight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      ),
    );
  }
}
