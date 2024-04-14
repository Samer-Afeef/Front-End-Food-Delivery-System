import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

AppBar customAppBar({required BuildContext context, void Function()? onBack}) {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    leading: IconButton(
      padding: const EdgeInsets.only(right: 20.0),
      icon: const Icon(
        Icons.arrow_back,
        color: AppColors.primaryColor,
      ),
      onPressed: onBack
    ),
    centerTitle: false,
    title: Text(
      'رجوع',
      style: Theme.of(context).textTheme.bodyText2,
    ),
  );
}