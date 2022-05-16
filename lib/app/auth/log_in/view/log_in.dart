import 'package:flutter/material.dart';
import 'package:flutter_shop/app/auth/log_in/controller/login_controller.dart';
import 'package:flutter_shop/app/auth/widgets/choose_lable.dart';
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

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LogInController>(
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
                key: controller.logInFormKey,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      backgroundMask(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heightSpace(20),
                            centerLogo(),
                            heightSpace(30),
                            blackTitle1("Log In"),
                            heightSpace(15),
                            smallGreyHint1("Enter your email and password"),
                            heightSpace(40),
                            InputField(
                              label: "Email",
                              hint: "Enter your email address",
                              inputType: TextInputType.emailAddress,
                              controller: controller.email,
                              validator: controller.emailValidator(),
                            ),
                            heightSpace(20),
                            InputField(
                              label: "Password",
                              hint: "Enter your password",
                              isPassword: true,
                              controller: controller.password,
                              inputType: TextInputType.emailAddress,
                              validator: controller.passwordValidator(),
                            ),
                            heightSpace(20),
                            const Align(
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                            heightSpace(30),
                            MainButton(
                              text: "Log In",
                            ).onTap(
                              () {
                                controller.login(context);
                              },
                            ),
                            heightSpace(30),
                            ChooseLabel(
                              black: "Don’t have an account?",
                              green: "Sign up",
                            ).onTap(
                              () {
                                controller.navigation.navigateToAndClearStack(
                                    RouteName.register);
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
