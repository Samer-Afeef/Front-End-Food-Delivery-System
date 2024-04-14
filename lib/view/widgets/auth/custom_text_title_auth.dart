import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2!.copyWith(
        color: AppColors.primaryColor
      ),
    );
  }
}
