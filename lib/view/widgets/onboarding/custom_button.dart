import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/app_colors.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key,});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Material(
        elevation: 5,
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: () {
            controller.next();
          },
          minWidth: 200,
          height: 42,
          textColor: Colors.white,
          child: const Text(
            "التالي",
          )
        ),
      ),
    );
  }
}
