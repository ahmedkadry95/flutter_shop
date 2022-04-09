import 'package:flutter/material.dart';
import 'package:flutter_shop/auth/view/sign_in/log_in.dart';
import 'package:flutter_shop/auth/widgets/choose_lable.dart';
import 'package:flutter_shop/auth/widgets/lable_terms.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/widgets/background_mask.dart';
import 'package:flutter_shop/widgets/inputField.dart';
import 'package:flutter_shop/widgets/logo.dart';
import 'package:flutter_shop/widgets/main_button.dart';

class Register extends StatelessWidget {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Stack(children: [
            backgroundMask(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  heightSpace(40),
                  centerLogo(),
                  heightSpace(30),
                  const Text("Sign Up"),
                  const SizedBox(height: 15),
                  const Text("Enter your credentials to continue"),
                  const SizedBox(height: 35),
                  InputField(
                    label: "Username",
                    hint: "Enter your username",
                    inputType: TextInputType.text,
                    controller: userName,
                    onChange: (String) {},
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: "mobile",
                    hint: "Enter your mobile",
                    inputType: TextInputType.text,
                    controller: mobile,
                    onChange: (String) {},
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: "Email",
                    hint: "Enter your email",
                    inputType: TextInputType.emailAddress,
                    controller: email,
                    onChange: (String) {},
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: "Password",
                    hint: "Enter your password",
                    isPassword: true,
                    inputType: TextInputType.text,
                    controller: password,
                    onChange: (String) {},
                  ),
                  const SizedBox(height: 12),
                  LabelTerms(),
                  const SizedBox(height: 30),
                  MainButton(
                    text: "LogIn",
                  ).onTap(
                    () async {
                      // await apiServices.signUpWithFireBase(
                      //   email: email.text,
                      //   password: password.text,
                      //   context: context,
                      //   phone: mobile.text,
                      //   name: userName.text,
                      // );
                    },
                  ),
                  const SizedBox(height: 20),
                  ChooseLabel(
                    black: "Already have an account?",
                    green: "Sign in",
                  ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogIn(),
                      ),
                    ); // N
                    // NavigationServices.goBack(context: context);
                  }),
                ],
              ),
            )
          ]),
        ));
  }
}
