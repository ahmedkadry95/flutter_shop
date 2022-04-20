import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/auth/widgets/auth_snak_bar.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/api_services.dart';
import 'package:flutter_shop/services/navigation_service.dart';

class RegisterController extends BaseController {
  FirebaseAuth auth = FirebaseAuth.instance;
  ApiServices apiServices = locator<ApiServices>();
  var navigation = locator<NavigationService>();

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController buildingNum = TextEditingController();

  register(BuildContext context) async {
    String registerResult = await apiServices.registerUser(
      email: email.text,
      password: password.text,
      mobile: mobile.text,
      userName: userName.text,
      context: context,
      city: city.text,
      street: street.text,
      buildingNum: buildingNum.text,
    );

    if (registerResult == 'user add successfully') {
      showDialog(
        context,
        dialogType: DialogType.SUCCES,
        desc: 'your account created successfully',
        title: 'Success',
        ok: () {},
      );
    } else if (registerResult == 'this password is too weak') {
      showDialog(
        context,
        dialogType: DialogType.WARNING,
        desc: 'password is to weak',
        title: 'Warning',
        ok: () {},
      );
    } else if (registerResult == 'this email is already exist') {
      showDialog(
        context,
        dialogType: DialogType.ERROR,
        desc: 'this email is already exist',
        title: 'Error',
        ok: () {},
      );
    }
  }

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

  validator(BuildContext context) async {
    if (userName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(userNameSnackBar);
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(emailSnackBar);
    } else if (mobile.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(mobileSnackBar);
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passwordSnackBar);
    } else if (city.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passwordSnackBar);
    } else if (street.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passwordSnackBar);
    } else if (buildingNum.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passwordSnackBar);
    } else {
      await register(context);
    }
  }

  toLogin() {
    navigation.navigateTo(RouteName.logIn);
  }
}
