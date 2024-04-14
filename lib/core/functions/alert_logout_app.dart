import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
Future<bool> alertLogoutApp({required void Function()? onConfirm}){
  Get.defaultDialog(
      title: "تنبيه",
      middleText: "هل تريد تسجيل الخروج",
      actions: [
        TextButton(onPressed: onConfirm, child: const Text("نعم")),
        TextButton(onPressed: (){
          Get.back();
        }, child: const Text("لا")),
      ]);
  return Future.value(true);
}

