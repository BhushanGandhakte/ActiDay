import 'package:actiday/framework/controller/login/login_control.dart';
import 'package:actiday/ui/base/base_ui.dart';
import 'package:actiday/ui/login/helper/common_button.dart';
import 'package:actiday/ui/login/helper/common_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WebLogin extends StatefulWidget {
  const WebLogin({super.key});

  @override
  State<WebLogin> createState() => _State();
}

class _State extends State<WebLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          return Form(
            key: LoginControl.formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextFormField(
                    height: screenWidth * 0.05,
                    width: screenWidth * 0.4,
                    controller: LoginControl.emailController,
                    validator: LoginControl.emailValidator,
                    labelText: "Email",
                  ),
                  SizedBox(height: 50),
                  CommonTextFormField(
                    height: screenWidth * 0.05,
                    width: screenWidth * 0.4,
                    controller: LoginControl.passwordController,
                    validator: LoginControl.passwordValidator,
                    labelText: "Password",
                  ),
                  SizedBox(height: 50),
                  CommonButton(
                      height: 50, width: 200,
                      title: "Login",
                      submit: submit
                  ),
                ],
              ),
            ),
          );
        },
     )
    );
  }

  void submit() {
    if (!LoginControl.formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Successful")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BaseUi()),
      );
    }else{
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Failed")));
    }

  }
}
