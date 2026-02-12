import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonSplashImg extends StatelessWidget {

  final double imgHeight;
  final double imgWidth;

  const CommonSplashImg({super.key, required this.imgHeight, required this.imgWidth });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        AppAssets.splashLogo,
        height: imgHeight,
        width: imgWidth,
    );
  }
}
