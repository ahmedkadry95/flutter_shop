import 'package:flutter/material.dart';
import 'package:flutter_shop/app/auth/log_in/view/log_in.dart';
import 'package:flutter_shop/app/auth/register/controller/register_controller.dart';
import 'package:flutter_shop/app/auth/widgets/choose_lable.dart';
import 'package:flutter_shop/app/auth/widgets/lable_terms.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';
import 'package:flutter_shop/widgets/background_mask.dart';
import 'package:flutter_shop/widgets/inputField.dart';
import 'package:flutter_shop/widgets/logo.dart';
import 'package:flutter_shop/widgets/main_button.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterController>(
      onModelReady: (controller) {},
      builder: (context, controller, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: SingleChildScrollView(
              child: Stack(
                children: [
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
                        blackTitle1("Sign Up"),
                        const SizedBox(height: 15),
                        smallGreyHint("Enter your credentials to continue"),
                        const SizedBox(height: 40),
                        InputField(
                          label: "Username",
                          hint: "Enter your username",
                          inputType: TextInputType.text,
                          controller: controller.userName,
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          label: "Email",
                          hint: "Enter your email",
                          inputType: TextInputType.emailAddress,
                          controller: controller.email,
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          label: "mobile",
                          hint: "Enter your mobile",
                          inputType: TextInputType.number,
                          controller: controller.mobile,
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          label: "Password",
                          hint: "Enter your password",
                          isPassword: true,
                          inputType: TextInputType.text,
                          controller: controller.password,
                        ),
                        const SizedBox(height: 12),
                        LabelTerms().onTap(() {}),
                        const SizedBox(height: 30),
                        MainButton(
                          text: "Sign Up",
                        ).onTap(
                          () async {
                            print('sign up clicked');
                            controller.validator(context);
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
                          );
                          // NavigationServices.goBack(context: context);
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
