import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
Future<bool> alertExitApp(){
  Get.defaultDialog(
      title: "تنبيه",
  middleText: "هل تريد الخروج من التطبيق",
  actions: [
    TextButton(onPressed: (){
      exit(0);
    }, child: const Text("نعم")),
    TextButton(onPressed: (){
      Get.back();
    }, child: const Text("لا")),
  ]);
  return Future.value(true);
}

