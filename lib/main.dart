import './routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './bindings/initial_bindings.dart';
import './core/constant/app_routes.dart';
import './core/services/my_services.dart';
import './core/constant/app_themes/arabic_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: arabicTheme,
      locale: const Locale("ar"),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings() ,
      initialRoute: AppRoutes.onBoarding,
      getPages: pagesRoute,
    );
  }
}
