import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/restaurant_dashboard_controller.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/shared/navigation/custom_animated_bottom_bar.dart';


class RestaurantDashBoard extends StatelessWidget {
  const RestaurantDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDashBoardControllerImp>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: IndexedStack(
            index: controller.tapIndex,
            children: controller.listPages
        ),
        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 70,
          backgroundColor: AppColors.backgroundColor,
          selectedIndex: controller.tapIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected:controller.changeTapIndex,
          items:<BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('الرئيسية'),
              activeColor:AppColors.secondaryColor.withOpacity(0.8),
              inactiveColor: AppColors.inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.shopping_basket_outlined),
              title: const Text("السلة"),
              activeColor:AppColors.secondaryColor.withOpacity(0.8),
              inactiveColor: AppColors.inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.access_time_outlined),
              title: const Text(
                'الطلبات',
              ),
              activeColor:AppColors.secondaryColor.withOpacity(0.8),
              inactiveColor: AppColors.inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('الاعدادات'),
              activeColor:AppColors.secondaryColor.withOpacity(0.8),
              inactiveColor: AppColors.inactiveColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),



      );
    },);
  }
}






