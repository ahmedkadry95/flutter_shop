import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_shop/auth/view/sign_in/log_in.dart';
import 'package:flutter_shop/utils/colors.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LogIn())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(child: Image.asset('assets/images/splash_logo.png')),
    );
  }
}
