import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';

class CurrentSessionService extends BaseController {
  CurrentSessionService._();

  static final _instance = CurrentSessionService._();

  factory CurrentSessionService() => _instance;

  var navigation = locator<NavigationService>();

  Location location = Location();
  String city = '';
  String street = '';
  String userToken = '';

  bool? _serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  String currentOrderId = '';

  Future<void> checkLocationServiceAndRequest() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        try {
          permissionGranted = await location.requestPermission();
        } catch (e) {
          print('erroe is : $e');
        }
      }
    }

    locationData = await location.getLocation();
  }

  getLocationDetails() async {
    if (locationData != null) {
      List<geocoding.Placemark> placeMarks =
          await geocoding.placemarkFromCoordinates(
        locationData!.latitude!,
        locationData!.longitude!,
      );
      city = placeMarks[0].name!;
      street = placeMarks[0].street!;
      print(placeMarks[0].country);
      print(placeMarks[0].street);
      print(placeMarks[0].name);
      print(placeMarks[0].administrativeArea);
    }
  }

  getToken() async {
    var firebaseMessaging = await FirebaseMessaging.instance;
    firebaseMessaging.getToken().then((token) {
      print('token is : $token');
      userToken = token!;
    });
  }
}
