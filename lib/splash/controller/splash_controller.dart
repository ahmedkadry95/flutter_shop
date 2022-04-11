import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/auth/log_in/view/log_in.dart';
import 'package:flutter_shop/base_controller.dart';

class SplashController extends BaseController {
  // FirebaseAuth auth = FirebaseAuth.instance;

  // void checkUser(BuildContext context) {
  //   auth.authStateChanges().listen(
  //     (User? user) {
  //       if (user == null) {
  //         print('user = null ');
  //         Timer(const Duration(seconds: 3), () {
  //           Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(
  //               builder: (BuildContext context) => LogIn(),
  //             ),
  //           );
  //         });
  //       } else {
  //         print('user != null ');
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(
  //             builder: (BuildContext context) => LogIn(),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  // navigate(){
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => LogIn(),
  //     ),
  //   );
  // }

}
