import 'package:flutter/material.dart';
import 'package:flutter_shop/app/auth/register/controller/register_controller.dart';
import 'package:flutter_shop/app/auth/widgets/choose_lable.dart';
import 'package:flutter_shop/app/auth/widgets/lable_terms.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/routs/routs_names.dart';
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
        return Container(
          color: backgroundColor,
          child: SafeArea(
            bottom: false,
            right: false,
            left: false,
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: Form(
                key: controller.registerFormKey,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      backgroundMask(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            heightSpace(20),
                            centerLogo(),
                            heightSpace(30),
                            blackTitle1("Sign Up"),
                            heightSpace(15),
                            smallGreyHint1(
                                "Enter your credentials to continue"),
                            heightSpace(40),
                            InputField(
                              label: "User Name",
                              hint: "Enter your username",
                              inputType: TextInputType.text,
                              controller: controller.userName,
                              validator: controller.userNameValidator(),
                            ),
                            heightSpace(20),
                            InputField(
                              label: "Email",
                              hint: "Enter your email",
                              inputType: TextInputType.emailAddress,
                              controller: controller.email,
                              validator: controller.emailValidator(),
                            ),
                            heightSpace(20),
                            InputField(
                              label: "Password",
                              hint: "Enter your password",
                              isPassword: true,
                              inputType: TextInputType.text,
                              controller: controller.password,
                              validator: controller.passwordValidator(),
                            ),
                            heightSpace(20),
                            InputField(
                              label: "Mobile",
                              hint: "Enter your mobile",
                              inputType: TextInputType.number,
                              controller: controller.mobile,
                              validator: controller.mobileValidator(),
                            ),
                            heightSpace(12),
                            LabelTerms().onTap(() {}),
                            heightSpace(30),
                            MainButton(
                              text: "Sign Up",
                            ).onTap(
                              () async {
                                controller.register(context);
                              },
                            ),
                            heightSpace(20),
                            ChooseLabel(
                              black: "Already have an account?",
                              green: "Sign in",
                            ).onTap(
                              () {
                                controller.navigation
                                    .navigateToAndClearStack(RouteName.logIn);
                              },
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
