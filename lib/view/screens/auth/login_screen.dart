import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handling_data.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/functions/valid_input.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_body_auth.dart';
import '../../widgets/auth/custom_text_form_auth.dart';
import '../../widgets/auth/custom_text_title_auth.dart';
import '../../widgets/auth/logo_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.backgroundColor,
          elevation: 0.0,
          title: Text("تسجيل الدخول",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColors.grey)),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
              builder: (controller) {
                return HandlingDataRequest(
                  loading: AppImageAsset.loadingLogin,
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 30.0),
                    child: Form(
                      key: controller.formState,
                      child: ListView(children: [
                        const SizedBox(height: 32,),
                        const LogoAuth(imagePath: AppImageAsset.logo),
                        const SizedBox(height: 16.0),
                        const CustomTextTitleAuth(text: "مرحبًا بعودتك"),
                        const SizedBox(height: 16.0),
                        const CustomTextBodyAuth(
                          text:
                              "قم بتسجيل الدخول باستخدام بريدك الإلكتروني وكلمة المرور ",
                        ),
                        const SizedBox(height: 24.0),
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          myController: controller.email,
                          hintText: "أدخل بريدك الإلكتروني",
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                          ),
                          labelText: "البريد إلالكتروني",
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 4, 30, "password");
                          },
                          myController: controller.password,
                          hintText: "ادخل كلمة المرور",
                          labelText: "كلمة المرور",
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.passwordVisible,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.passVisibility();
                            },
                            icon: controller.passwordIcon(),
                          ),
                        ),

                        CustomButtonAuth(
                            text: "تسجيل الدخول",
                            onPressed: () {
                              controller.login();
                            }),
                        const SizedBox(height: 20.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomTextBodyAuth(
                              text: "ليس لديك حساب ؟",
                            ),
                            InkWell(
                              onTap: () {
                                controller.goToSignUp();
                              },
                              child: Text(
                                "اشتراك",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                );
              },
            )));
  }
}
