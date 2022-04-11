import 'package:flutter_shop/auth/register/controller/register_controller.dart';
import 'package:flutter_shop/home/controller/home_controller.dart';
import 'package:flutter_shop/services/api_services.dart';
import 'package:flutter_shop/splash/controller/splash_controller.dart';
import 'package:get_it/get_it.dart';

import 'auth/log_in/controller/login_controller.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiServices());
  initSingleton();
  locator.registerFactory(() => LogInController());
  locator.registerFactory(() => RegisterController());
  locator.registerFactory(() => SplashController());
  locator.registerFactory(() => HomeController());
}

void initSingleton() {
  locator<ApiServices>();
}
