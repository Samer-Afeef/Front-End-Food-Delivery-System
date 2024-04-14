



import './view/screens/Restaurant_dashboard.dart';

import './view/screens/home_screen.dart';

import './view/screens/auth/signup_screen.dart';

import './view/screens/auth/login_screen.dart';

import './view/screens/onboarding_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import './core/constant/app_routes.dart';
import './core/middleware/auth_middleware.dart';
import 'bindings/restaurant_dashboard_bending.dart';



List<GetPage<dynamic>> pagesRoute =[

  //======================== OnBoardingScreen ============================
  GetPage(name:AppRoutes.onBoarding, page: ()=> const OnBoardingScreen(),middlewares: [
  AuthMiddleware(),
  ]),
  GetPage(name:AppRoutes.login, page: ()=> const LoginScreen()),
  GetPage(name:AppRoutes.sinUp, page: ()=> const SignUpScreen()),
  GetPage(name:AppRoutes.homeScreen, page: ()=> const HomeScreen()),
  GetPage(name: AppRoutes.restaurantDashBoard, page: () =>const RestaurantDashBoard(),
      binding: RestaurantDashBoardBinding()),


];


