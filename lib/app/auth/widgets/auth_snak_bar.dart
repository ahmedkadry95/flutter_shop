import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';

final failsAuthSnackBar = SnackBar(
  content: const Text('sorry : your email or password is wrong '),
  action: SnackBarAction(
    label: 'Try again',
    textColor: whiteColor,
    onPressed: () {
      // Some code to undo the change.
    },
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);

final userNameSnackBar = SnackBar(
  content: const Text('Pleas enter your user name'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final emailSnackBar = SnackBar(
  content: const Text('Pleas enter your email'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final mobileSnackBar = SnackBar(
  content: const Text('Pleas enter your mobile number'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final passwordSnackBar = SnackBar(
  content: const Text('Pleas enter your password'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
