import '../../../core/constant/app_colors.dart';

import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  final String imagePath;
  const LogoAuth({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 70.0,
        backgroundColor: AppColors.backgroundColor,
        child: ClipOval(
          child: Image.asset(
           imagePath,
          ),
        ));
  }
}
