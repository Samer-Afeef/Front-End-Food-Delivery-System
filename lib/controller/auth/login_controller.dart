import 'package:food_delivery/data/data_source/remote/auth/token_data.dart';
import 'package:food_delivery/data/model/user_model.dart';
import 'package:get/get.dart';
import '../../core/services/my_services.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/shared/custom_dialog.dart';
import '../../data/data_source/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  late UserModel userModel;

  MyServices myServices = Get.find();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  LoginData loginData = LoginData(crud: Get.find());
  TokenData tokenData = TokenData(crud: Get.find());

  @override
  void onInit() {
    getToken();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  String? token;

  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await loginData.postData(email: email.text, password: password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        userModel = UserModel.fromJson(response);
        await tokenData.tokenUpdate(
            customerId: userModel.id.toString(), token: token!);

        myServices.sharedPreferences.setBool("login", true);
        myServices.sharedPreferences.setString("id", "$userModel.id");
        myServices.sharedPreferences.setString("fullName", userModel.fullName!);
        myServices.sharedPreferences.setString("email", userModel.email!);

        Get.offAllNamed(AppRoutes.homeScreen);
      } else if (statusRequest == StatusRequest.failure) {
        customDialog(
          title: "تنبيه",
          middleText: " كلمة المرور او البريد الاكتروني غير صحيح ",
          textCancel: "موافق",
        );
      }
    }

    update();
  }

  bool passwordVisible = true;

  void passVisibility() {
    passwordVisible = !passwordVisible;
    update();
  }

  Icon passwordIcon() {
    if (passwordVisible) {
      return const Icon(
        Icons.visibility_off_outlined,
        color: AppColors.grey,
      );
    } else {
      return const Icon(Icons.remove_red_eye_outlined, color: AppColors.grey);
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.sinUp,arguments: {'token': token});
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
