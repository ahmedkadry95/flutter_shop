import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:location/location.dart';

class CurrentSessionService extends BaseController {
  CurrentSessionService._();

  static final _instance = CurrentSessionService._();

  factory CurrentSessionService() => _instance;

  var navigation = locator<NavigationService>();

  Location location = new Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? locationData;

  Future<void> checkLocationServiceAndRequest() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        navigation.navigateToAndClearStack(
            RouteName.home); // if user refuse location service
      }
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          navigation.navigateToAndClearStack(
              RouteName.home); // if user refuse location service
        }
      }
      locationData = await location.getLocation();
      print(locationData);
      print(locationData!.latitude);
      print(locationData!.longitude);
    }
    setState(ViewState.idel);
  }
}
