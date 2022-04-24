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
  var navigation = locator<NavigationService>();
  var pref = locator<SharedPrefServices>();

  var user = FirebaseAuth.instance.currentUser;

  bool? serviceState;
  PermissionStatus? permissionGranted;

  Location location = Location();
  late LocationData userLocation;

  splashNavigation() async {
    if (user == null) {
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

  Future<void> checkLocationServiceAndRequest() async {
    serviceState = await location.serviceEnabled();
    if (serviceState!) {
      //if serviceState enable  => check permission
      permissionGranted = await location.hasPermission();
      //if permission denied =>  request permission
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
      } else {
        // if permission granted  =>  get user  location
        await getUserLocation();
        await saveUserLocationInPref();
      }
    }
  }

  Future<void> getUserLocation() async {
    userLocation = await location.getLocation();
    print('userLocation $userLocation');
  }

  saveUserLocationInPref() async {
    var currentLatitude = userLocation.latitude!;
    var currentLongitude = userLocation.longitude!;
    await pref.saveDouble(latitude, currentLatitude);
    await pref.saveDouble(longitude, currentLongitude);
  }

  getUserLocationFromPref() async {
    try {
      var currentLatitude = await pref.getDouble(latitude);
      if (currentLatitude == 0.0) {
        await checkLocationServiceAndRequest();
        splashNavigation();
      } else {
        splashNavigation();
      }
    } catch (e) {
      print(e);
      splashNavigation();
    }
  }
}
