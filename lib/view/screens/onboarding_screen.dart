import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/app_colors.dart';
import '../../controller/onboarding_controller.dart';
import '../widgets/onboarding/custom_button.dart';
import '../widgets/onboarding/custom_slider.dart';
import '../widgets/onboarding/custom_dot_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
 Get.put(OnBoardingControllerImp(),permanent: false);
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.white,),
      backgroundColor: AppColors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Expanded(
          flex: 5,
          child:  CustomSliderOnBoarding(),
        ),
         CustomDotControllerOnBoarding(),
      CustomButtonOnBoarding(),
      ],
    ));
  }
}
