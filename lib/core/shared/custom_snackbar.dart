import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_colors.dart';
customSnackBar({
  required String title,
  required String middleText,
  Widget? iconSnackBar
}){

  Get.snackbar(

      title,middleText,
      colorText: AppColors.black ,
      icon:iconSnackBar,
      snackPosition: SnackPosition.TOP,

  );
}