import 'package:flutter_shop/app/account/conttroler/account_conttroller.dart';
import 'package:flutter_shop/app/add_delivery_address/controller/add_delivery_address_controller.dart';
import 'package:flutter_shop/app/auth/log_in/controller/login_controller.dart';
import 'package:flutter_shop/app/auth/register/controller/register_controller.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/app/home/controller/home_controller.dart';
import 'package:flutter_shop/app/last_orders/controller/last_orders_controller.dart';
import 'package:flutter_shop/app/placed_orders/controller/placed_order_controller.dart';
import 'package:flutter_shop/app/shop/controller/shop_controller.dart';
import 'package:flutter_shop/app/splash/controller/splash_controller.dart';
import 'package:flutter_shop/app/track_order/controller/track_order_controller.dart';
import 'package:flutter_shop/services/api_services.dart';
import 'package:flutter_shop/services/current_session_service.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';
import 'package:get_it/get_it.dart';

import 'app/explore/controller/explore_controller.dart';
import 'widgets/product_card/product_card_controller.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiServices());
  locator.registerLazySingleton(() => SharedPrefServices());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => CurrentSessionService());

  initSingleton();
  locator.registerFactory(() => LogInController());
  locator.registerFactory(() => RegisterController());
  locator.registerFactory(() => SplashController());
  locator.registerFactory(() => HomeController());
  locator.registerFactory(() => AccountController());
  locator.registerFactory(() => ShopController());
  locator.registerFactory(() => AddDeliveryAddressController());
  locator.registerFactory(() => CartController());
  locator.registerFactory(() => ProductCardController());
  locator.registerFactory(() => ExploreController());
  locator.registerFactory(() => PlacedOrders());
  locator.registerFactory(() => LastOrdersController());
  locator.registerFactory(() => TrackOrderController());
}

void initSingleton() {
  locator<ApiServices>();
  locator<SharedPrefServices>();
  locator<NavigationService>();
  locator<CurrentSessionService>();
}
