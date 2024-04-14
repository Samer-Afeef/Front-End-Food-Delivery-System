import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/data_source/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Text(
                  onBoardingList[index].title,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16,),
              Image.asset(onBoardingList[index].image,fit: BoxFit.cover),
              const SizedBox(height: 16,),
              Container(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[index].body,
                  textAlign: TextAlign.center,
                  style:  const TextStyle(
                      fontSize: 16.0,
                      height: 1.9,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
