import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/api_services.dart';
import 'package:flutter_shop/services/navigation_service.dart';

import '../../../../utils/colors.dart';

class RegisterController extends BaseController {
  FirebaseAuth auth = FirebaseAuth.instance;
  ApiServices apiServices = locator<ApiServices>();
  var navigation = locator<NavigationService>();

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();

  final registerFormKey = GlobalKey<FormState>();

  // register(BuildContext context) async {
  //   String registerResult = await apiServices.registerUser(
  //     email: email.text,
  //     password: password.text,
  //     mobile: mobile.text,
  //     userName: userName.text,
  //     context: context,
  //   );
  //
  //   if (registerResult == 'user add successfully') {
  //     showDialog(
  //       context,
  //       dialogType: DialogType.SUCCES,
  //       desc: 'your account created successfully',
  //       title: 'Success',
  //       ok: () {},
  //     );
  //   } else if (registerResult == 'this password is too weak') {
  //     showDialog(
  //       context,
  //       dialogType: DialogType.WARNING,
  //       desc: 'password is to weak',
  //       title: 'Warning',
  //       ok: () {},
  //     );
  //   } else if (registerResult == 'this email is already exist') {
  //     showDialog(
  //       context,
  //       dialogType: DialogType.ERROR,
  //       desc: 'this email is already exist',
  //       title: 'Error',
  //       ok: () {},
  //     );
  //   }
  // }

  void showDialog(
    context, {
    required DialogType dialogType,
    required String title,
    required String desc,
    required Function ok,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.TOPSLIDE,
      title: title,
      desc: desc,
      btnOkOnPress: () {
        ok();
      },
    ).show();
  }

  toLogin() {
    navigation.navigateTo(RouteName.logIn);
  }

  FormFieldValidator<String>? userNameValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return 'enter your user name ';
      }
      return null;
    };
    return validator;
  }

  FormFieldValidator<String>? emailValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return 'enter your email ';
      }
      if (!isValidEmail(value.trim())) {
        return 'sorry this email not valid';
      }
      return null;
    };
    return validator;
  }

  bool isValidEmail(String email) {
    bool emailValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
    return emailValid;
  }

  FormFieldValidator<String>? passwordValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return 'enter your password';
      }
      if (value.length < 6) {
        return 'this password is to short';
      }
      return null;
    };
    return validator;
  }

  FormFieldValidator<String>? mobileValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return 'enter your mobile';
      }
      if (value.length != 11) {
        return 'this mobile number not valid';
      }
      return null;
    };
    return validator;
  }

  void register(BuildContext context) async {
    if (registerFormKey.currentState!.validate()) {
      setState(ViewState.busy);
      String registerResult = await apiServices.registerUser(
        email: email.value.text.toString().trim(),
        password: password.text,
        mobile: mobile.text,
        userName: userName.text,
      );
      switch (registerResult) {
        case 'user add successfully':
          {
            ScaffoldMessenger.of(context)
                .showSnackBar(successfulRegisterSnackBar);
            navigation.navigateToAndClearStack(RouteName.home);
          }
          break;
        case 'this password is too weak':
          {
            print('this password is too weak');
          }
          break;
        case 'this email is already exist':
          {
            ScaffoldMessenger.of(context).showSnackBar(existSnackBar);
          }
          break;
        default:
          {}
          break;
      }
      setState(ViewState.idel);
    }
  }
}

final failsAuthSnackBar = SnackBar(
  content: const Text('sorry : your email or password is wrong '),
  action: SnackBarAction(
    label: 'Try again',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);

final successfulRegisterSnackBar = SnackBar(
  content: const Text('your account created successfully'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  duration: Duration(milliseconds: 5),
  backgroundColor: Colors.green,
  behavior: SnackBarBehavior.floating,
);

final existSnackBar = SnackBar(
  content: const Text('this email is already exist'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  duration: Duration(seconds: 5),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
