import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/account/conttroler/account_conttroller.dart';
import 'package:flutter_shop/app/account/widgets/account_screen_item.dart';
import 'package:flutter_shop/app/account/widgets/log_out_button.dart';
import 'package:flutter_shop/app/account/widgets/report_problem_bottom_sheet.dart';
import 'package:flutter_shop/app/account/widgets/user_avatar.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routs/routs_names.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AccountController>(
      onModelReady: (controller) async {
        controller.getUserData();
      },
      builder: (context, controller, child) {
        return ListView(
          children: [
            heightSpace(40),
            userAvatar(
              image: controller.userImage,
              userName: controller.userName,
              email: controller.userEmail,
            ),
            heightSpace(30),
            userScreenItem(
              image: 'assets/icons/location.png',
              text: 'Delivery Address',
            ).onTap(() {
              controller.navigation.navigateTo(RouteName.deliveryAddress);
            }),
            userScreenItem(
              image: 'assets/icons/payment.png',
              text: 'Payment Method',
            ),
            userScreenItem(
              image: 'assets/icons/notifications.png',
              text: 'Notifications',
            ),
            userScreenItem(
              image: 'assets/icons/help.png',
              text: 'Help',
            ).onTap(() {
              reportProblemBottomSheetMenu(context);
            }),
            userScreenItem(
              image: 'assets/icons/about.png',
              text: 'About',
            ).onTap(() {
              // context: context, routeName: RouteName.ABOUT_APP);          NavigationServices.goTo(
            }),
            heightSpace(90),
            logOutButton().onTap(() async {
              await controller.signOut();
            }),
            heightSpace(30),
          ],
        );
      },
    );
  }
}

void reportProblemBottomSheetMenu(context) {
  TextEditingController errorText = TextEditingController();
  showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Wrap(
            runSpacing: 25,
            spacing: 20,
            children: [
              Row(
                children: [
                  Text(
                    'Report for problem',
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // NavigationServices.goBack(context: context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              ReportTextField(
                errorText: errorText,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: sendButton(text: 'Send').onTap(() async {
                        final mailtoLink = Mailto(
                          to: [
                            'ahmedyoussefkadry95@gmail.com',
                          ],
                          subject: '',
                          body: errorText.text,
                        );

                        await launch('$mailtoLink');
                      }),
                    ),
                    widthSpace(5),
                    Expanded(
                      flex: 1,
                      child: cancelButton().onTap(
                        () {
                          // NavigationServices.goBack(context: context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
