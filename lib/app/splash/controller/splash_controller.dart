import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';
import 'package:flutter_shop/utils/strings.dart';
import 'package:location/location.dart';

class SplashController extends BaseController {
  var pref = locator<SharedPrefServices>();
  var navigation = locator<NavigationService>();
  var user = FirebaseAuth.instance.currentUser;
  Location location = Location();

  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  splashNavigation() async {
    if (user == null) {
      await getLocation();
      navigationTimer(RouteName.logIn);
    } else {
      navigationTimer(RouteName.home);
    }
  }

  void navigationTimer(String routName) {
    Timer(
      const Duration(seconds: 3),
      () {
        navigation.navigateToAndClearStack(routName);
      },
    );
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
