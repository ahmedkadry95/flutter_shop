import 'package:flutter/material.dart';

Align centerLogo() {
  return Align(
    child: Image.asset(
      'assets/images/logo.png',
      width: 30,
    ),
    alignment: Alignment.center,
  );
}
