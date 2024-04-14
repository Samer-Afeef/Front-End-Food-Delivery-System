import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/data_source/static/static.dart';

class CustomDotControllerOnBoarding  extends StatelessWidget {
  const CustomDotControllerOnBoarding ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(onBoardingList.length, (index) {
              return AnimatedContainer(
                margin: const EdgeInsets.only(right: 5.0, top: 5.0,bottom: 40.0),
                duration: const Duration(microseconds: 900),
                width: controller.currentPage == index ? 12.0 :6.7,
                height:  6.0,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.0)),
              );
            })
          ],
        );
      },
    );


  }
}
