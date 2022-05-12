import 'package:flutter/material.dart';
import 'package:flutter_shop/app/account/conttroler/account_conttroller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
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
              controller.userImage == ''
                  ? const CircleAvatar(
                      radius: 35,
                      backgroundColor: mainColor,
                    )
                  : userImage(controller).onTap(() {
                      controller.updateUserImage(context);
                    }),
              widthSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.userName!),
                  widthSpace(4),
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

Stack userImage(AccountController controller) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(controller.userImage!),
        radius: 35,
        backgroundColor: mainColor,
      ),
      Positioned(
        bottom: 5,
        right: -8,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.edit,
            size: 18,
            color: mainColor,
          ),
        ),
      )
    ],
  );
}
