import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;

  const CommonTextFormField({super.key, this.labelText, this.controller, this.validator});

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.grey
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.clrf048c6, width: 1,),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:  AppColors.clrf048c6, width: 1,),
          )
      ),
    );
  }
}
