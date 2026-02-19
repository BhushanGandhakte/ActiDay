import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatefulWidget {

  final double? height;
  final double? width;
  final String? title;
  final void Function()? submit;

  const CommonButton({super.key, this.height, this.width, this.submit, this.title});

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.submit,
      child: CommonContainer(
        height: widget.height ?? 100,
        width: widget.width ?? 300,
        borderRadius: 20,
        color: AppColors.clrF048c6,
        child: Center(
          child: CommonText(
              title: widget.title ?? 'NA',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
