import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/admin/view/admin_view.dart';
import 'package:flutter_shop/app/add_delivery_address/view/add_delivery_address_view.dart';
import 'package:flutter_shop/app/auth/log_in/view/log_in.dart';
import 'package:flutter_shop/app/auth/register/view/register.dart';
import 'package:flutter_shop/app/delivery_address/view/delivery_address_view.dart';
import 'package:flutter_shop/app/home/view/home.dart';
import 'package:flutter_shop/app/splash/view/splash_view.dart';
import 'package:flutter_shop/routs/routing_data.dart';
import 'package:flutter_shop/routs/routs_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    print('settings.name ${settings.name}');

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );

    switch (routingData.route) {
      case RouteName.splash:
        return _getPageRoute(const SplashView(), settings);
      case RouteName.logIn:
        return _getPageRoute(const LogIn(), settings);
      case RouteName.register:
        return _getPageRoute(const Register(), settings);
      case RouteName.home:
        return _getPageRoute(const HomeView(), settings);
      case RouteName.admin:
        return _getPageRoute(const AdminView(), settings);
      case RouteName.addDeliveryAddress:
        return _getPageRoute(const AddDeliveryAddressView(), settings);
      case RouteName.deliveryAddress:
        return _getPageRoute(const DeliveryAddressView(), settings);
      default:
        return _getPageRoute(const SplashView(), settings);
    }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
