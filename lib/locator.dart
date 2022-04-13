import 'package:flutter_shop/admin/controller/admin_controller.dart';
import 'package:flutter_shop/app/account/conttroler/account_conttroller.dart';
import 'package:flutter_shop/app/auth/log_in/controller/login_controller.dart';
import 'package:flutter_shop/app/auth/register/controller/register_controller.dart';
import 'package:flutter_shop/app/home/controller/home_controller.dart';
import 'package:flutter_shop/app/splash/controller/splash_controller.dart';
import 'package:flutter_shop/services/api_services.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiServices());
  locator.registerLazySingleton(() => SharedPrefServices());
  locator.registerLazySingleton(() => NavigationService());

  initSingleton();
  locator.registerFactory(() => LogInController());
  locator.registerFactory(() => RegisterController());
  locator.registerFactory(() => SplashController());
  locator.registerFactory(() => HomeController());
  locator.registerFactory(() => AccountController());
  locator.registerFactory(() => AdminController());
}

void initSingleton() {
  locator<ApiServices>();
  locator<SharedPrefServices>();
  locator<NavigationService>();
}
