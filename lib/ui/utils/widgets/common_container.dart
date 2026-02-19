import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommonContainer extends StatefulWidget {

  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;
  final Widget? child;

  const CommonContainer({super.key, this.height, this.width, this.color, this.borderRadius, this.child});

  @override
  State<CommonContainer> createState() => _CommonContainerState();

}

class _CommonContainerState extends State<CommonContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 400,
      width: widget.width ?? 335,
      decoration: BoxDecoration(
        color: widget.color ?? AppColors.clrFaFaFa,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
      ),
      child: widget.child,
    );
  }
}
