import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/auth/widgets/auth_snak_bar.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/api_services.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';
import 'package:flutter_shop/utils/strings.dart';
import 'package:location/location.dart';

class LogInController extends BaseController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var apiServices = locator<ApiServices>();
  var navigation = locator<NavigationService>();
  var pref = locator<SharedPrefServices>();
  Location location = Location();
  String? loginSuccess;
  String? userToken;

  logIn(BuildContext context) async {
    loginSuccess = await apiServices.login(
      email: email.text,
      password: password.text,
    );
    if (loginSuccess! == 'true') {
      navigation.navigateToAndClearStack(RouteName.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(failsAuthSnackBar);
    }
  }

  validator(BuildContext context) {
    if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(emailSnackBar);
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passwordSnackBar);
    } else {
      logIn(context);
    }
  }

  getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      _locationData = await location.getLocation();
      await pref.saveDouble(latitude, _locationData.latitude);
      await pref.saveDouble(longitude, _locationData.longitude);
      print('_locationData : $_locationData');
    }
  }
}
