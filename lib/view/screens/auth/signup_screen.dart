import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handling_data.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../../core/functions/valid_input.dart';
import '../../widgets/auth/custom_button_auth.dart';

import '../../widgets/auth/custom_text_form_auth.dart';
import '../../widgets/auth/custom_text_title_auth.dart';
import '../../widgets/auth/custom_txtbtn_signup_or_signin.dart';
import '../../widgets/auth/logo_auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: Text("اشتراك",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColors.grey)),
      ),
      body:WillPopScope(
    onWillPop: alertExitApp,
    child: GetBuilder<SignUpControllerImp>(builder: (controller) {
      return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            child: Form(
              key: controller.formState,
              child: ListView(children: [
                const LogoAuth(imagePath: AppImageAsset.logo),
                const SizedBox(height: 16.0),
                const CustomTextTitleAuth(text: "Wasale"),
                const SizedBox(height: 24.0),
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 6,20, "");
                  },
                  myController: controller.userName,
                  hintText:  "ادخل الاسم كامل",
                  labelText:  "الاسم كامل",
                  suffixIcon: const Icon(Icons.person_outlined),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 5,100, "email");
                  },
                  myController: controller.email,
                  hintText: "أدخل بريدك الإلكتروني",
                  labelText: "البريد الإلكتروني",
                  suffixIcon: const Icon(Icons.email_outlined),
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 6,20, "");
                  },
                  myController: controller.address,
                  hintText:  "ادخل العنوان",
                  labelText:  "العنوان",
                  suffixIcon: const Icon(Icons.maps_home_work_outlined),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 9,13, "phone");
                  },
                  myController: controller.phone,
                  hintText:  "ادخل رقم الهاتف",
                  labelText:  "رقم الهاتف",
                  suffixIcon: const Icon(Icons.phone_android_outlined),
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 5,30, "password");
                  },
                  myController: controller.password,
                  hintText:"ادخل كلمة المرور",
                  labelText:"كلمة المرور",
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.passwordVisible,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.passVisibility();
                    },
                    icon: controller.passwordIcon(),
                  ),

                ),
                CustomButtonAuth(text: "اشتراك", onPressed: () {
                  controller.signUp();
                }),
                const SizedBox(height: 24.0),
                CustomTxtBtnSignUpOrSignIn(
                  textQuestion: "لديك حساب ؟ ",
                  textButton: "تسجيل الدخول",
                  onTap: () {
                    controller.goToLogin();
                  },
                ),
              ]),
            ),
          ),);
    },)
    ));
  }
}