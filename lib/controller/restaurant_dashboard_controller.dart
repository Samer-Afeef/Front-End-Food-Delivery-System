import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../core/services/my_services.dart';
import '../data/model/restaurant_model.dart';

abstract class RestaurantDashBoardController extends GetxController {
  changeTapIndex(int index);

  initialData();
}

class RestaurantDashBoardControllerImp extends RestaurantDashBoardController {
  late RestaurantModel restaurantModel;
  MyServices myServices = Get.find();
  int tapIndex = 0;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  List<Widget> listPages = [];

  @override
  initialData() {

    listPages = [
     // home screen
      //  cart screen
     // order screen
      // setting screen
    ];
  }

  @override
  changeTapIndex(int index) {
    tapIndex = index;
    if (index == 0) {
     // get home screen
    } else if (index == 1) {
     // get cart screen
    } else if (index == 2) {
      // get order screen
    } else {
      // get setting screen
    }
    update();
  }



}
