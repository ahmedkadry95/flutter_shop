import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/current_session_service.dart';
import 'package:flutter_shop/services/navigation_service.dart';

class TrackOrderController extends BaseController {
  CurrentSessionService currentSessionService = CurrentSessionService();
  var navigation = locator<NavigationService>();

}
