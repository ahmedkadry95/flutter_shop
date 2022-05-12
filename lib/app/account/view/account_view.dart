import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/account/conttroler/account_conttroller.dart';
import 'package:flutter_shop/app/account/widgets/account_screen_item.dart';
import 'package:flutter_shop/app/account/widgets/log_out_button.dart';
import 'package:flutter_shop/app/account/widgets/report_problem_bottom_sheet.dart';
import 'package:flutter_shop/app/account/widgets/user_avatar.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AccountController>(
      onModelReady: (controller) async {
        controller.getUserData();
      },
      builder: (context, controller, child) {
        return SafeArea(
          child: Stack(
            children: [
              ListView(
                children: [
                  heightSpace(40),
                  const UserAvatar(),
                  heightSpace(40),
                  
                  userScreenItem(
                    icon: Icons.shopping_cart,
                    text: 'Orders',
                  ).onTap(() {
                    controller.navigation.navigateTo(RouteName.lastOrders);
                  }),
                  userScreenItem(
                    text: 'Help',
                    icon: Icons.help,
                  ).onTap(() {
                    reportProblemBottomSheetMenu(context);
                  }),
                  userScreenItem(
                    text: 'About',
                    icon: Icons.info,
                  ).onTap(() {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.INFO,
                      animType: AnimType.SCALE,
                      title: 'About ',
                      desc:
                          'with more than 1000 product This app helping you to get all what you want from market like cheese ,milk , drinks , fresh fruit and vegetables ... all what you need is place your order and wait during 45 minutes your order will be delivered ',
                      btnOkOnPress: () {},
                    ).show();
                  }),
                  heightSpace(30),
                ],
              ),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: logOutButton().onTap(() async {
                  await controller.signOut();
                }),
              ),
            ],
          ),
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
                  blackTitle4(
                    'Report for problem',
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
                          Navigator.of(context).pop();
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
