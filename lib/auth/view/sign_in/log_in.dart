import 'package:flutter/material.dart';
import 'package:flutter_shop/auth/view/sign_up/sign_up.dart';
import 'package:flutter_shop/auth/widgets/choose_lable.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/widgets/background_mask.dart';
import 'package:flutter_shop/widgets/inputField.dart';
import 'package:flutter_shop/widgets/logo.dart';

class LogIn extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              backgroundMask(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(40),
                    centerLogo(),
                    heightSpace(30),
                    const Text("Log In"),
                    heightSpace(15),
                    const Text("Enter your email and password"),
                    heightSpace(35),
                    InputField(
                      label: "Email",
                      hint: "Enter your email address",
                      inputType: TextInputType.emailAddress,
                      controller: email,
                      onChange: (String) {},
                    ),
                    heightSpace(20),
                    InputField(
                      label: "Password",
                      hint: "Enter your password",
                      isPassword: true,
                      controller: password,
                      onChange: (value) {},
                      inputType: TextInputType.emailAddress,
                    ),
                    heightSpace(15),
                    const Align(
                      child: Text(
                        "Forgot Password?",
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    heightSpace(30),
                    const Text(
                      "LogIn",
                    ).onTap(() {}),
                    heightSpace(30),
                    ChooseLabel(
                      black: "Don’t have an account?",
                      green: "Signup",
                    ).onTap(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        ); // NavigationServices.goTo(
                        //     context: context,
                        //     routeName: RouteName.SIGNUP_SCREEN);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
