import 'package:flutter/material.dart';

class LoginControl {
  static final formKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static String? emailValidator(String? value){
    print(" = $value fghhtrhy");
    if(value == null || value.isEmpty){
      return "Enter an email";
    }
    if(!RegExp(r'^[a-z0-9.+-_%]+@[a-z]+\.[a-z]{2,}$').hasMatch(value)){
      return "Enter a valid email";
    }
    return null;
  }

  static String? passwordValidator(String? value){
    if(value == null || value.isEmpty){
      return "Enter password";
    }
    if(!RegExp( r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$').hasMatch(value)){
      return "Enter a valid password";
    }
    return null;
  }
}