import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_colors.dart';

customDialog({required String title,required String middleText,String? textOk,String? textCancel,void Function()? onOk,void Function()? onCancel,}){
  Get.defaultDialog(
      title:title,
      middleText: middleText,
      titleStyle: const TextStyle(color: AppColors.primaryColor),
      middleTextStyle: const TextStyle(color: AppColors.white),
      textCancel: textCancel,
      textConfirm: textOk,
      onCancel: onCancel,
      onConfirm: onOk,
      backgroundColor: AppColors.thirdColor,
      cancelTextColor: AppColors.white
  );
}