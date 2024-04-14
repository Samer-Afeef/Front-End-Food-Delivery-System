import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/app_routes.dart';
import '../../core/services/my_services.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool("login") == true) {
      return const RouteSettings(name:AppRoutes.homeScreen);
    }
    if (myServices.sharedPreferences.getBool("onBoarding") == true) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;

  }

}