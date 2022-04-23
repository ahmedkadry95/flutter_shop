import 'package:flutter/material.dart';
import 'package:flutter_shop/app/account/conttroler/account_conttroller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';


class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AccountController>(
      onModelReady: (controller) async {
        controller.getUserData();
      },
      builder: (context, controller, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Image.network(
                  controller.userImage!,
                  fit: BoxFit.contain,
                ),
              ),
              widthSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.userName!),
                      widthSpace(4),
                      const Icon(
                        Icons.edit,
                        size: 14,
                        color: mainColor,
                      )
                    ],
                  ),
                  heightSpace(4),
                  Text(controller.userEmail!),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
