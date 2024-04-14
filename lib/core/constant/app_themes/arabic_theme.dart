import 'package:flutter/material.dart';

import '../app_colors.dart';

ThemeData arabicTheme = ThemeData(
    useMaterial3: true,
    //fontFamily: 'Amiri',
    fontFamily: 'ElMessiri',
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary:AppColors.secondaryColor,background: AppColors.backgroundColor,primary: AppColors.primaryColor,brightness:Brightness.light,),
    floatingActionButtonTheme:
    const FloatingActionButtonThemeData(backgroundColor: AppColors.primaryColor),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0.0,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
     titleTextStyle: TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
         fontFamily: 'ElMessiri',
        fontSize: 17.5),
     backgroundColor: AppColors.backgroundColor,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 22.0,
          fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: AppColors.black,
          fontSize: 26.0,
          fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
          fontSize: 16.0,
          height: 1.9,
          fontWeight: FontWeight.bold,
          color: AppColors.grey),
      bodyText2: TextStyle(

          fontSize: 14.0,
          height: 2.0,
          color: AppColors.grey),

    ));