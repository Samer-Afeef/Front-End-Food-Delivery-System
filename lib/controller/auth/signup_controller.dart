import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/my_services.dart';
import '../../data/data_source/remote/auth/signup_data.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_routes.dart';
import '../../data/data_source/remote/auth/token_data.dart';
import '../../data/model/user_model.dart';

abstract class SignUpController extends GetxController {
  signUp();

  goToLogin();


}

class SignUpControllerImp extends SignUpController {

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  MyServices myServices = Get.find();

  late TextEditingController userName;
  late TextEditingController address;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController email;

  StatusRequest statusRequest = StatusRequest.none;

  late UserModel userModel;

  SignUpData signUpData = SignUpData(crud: Get.find());
  TokenData tokenData = TokenData(crud: Get.find());

  String? token;

  @override
  void onInit() {
    token = Get.arguments['token'];
    userName = TextEditingController();
    address = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          fullName: userName.text,
          email: email.text,
          address: address.text,
          phone: phone.text,
          password: password.text);
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
        Get.defaultDialog(
            title: "تنبيه",
            middleText: " هـذا الحـسـاب مـوجـود ",
           );
      }
    }

    update();
  }



  @override
  void dispose() {
    userName.dispose();
    address.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
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
}
