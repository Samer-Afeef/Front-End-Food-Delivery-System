import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/services/my_services.dart';
import '../core/constant/app_routes.dart';
import '../data/data_source/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;

  @override
  void onInit() {
    //   InitialState
    pageController = PageController();
    super.onInit();
  }

  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage == onBoardingList.length) {
      myServices.sharedPreferences.setBool("onBoarding", true);
      Get.offAllNamed(
        AppRoutes.login,
      );
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
