
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CustomButtonGlobal extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonGlobal({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 20, left: 20,bottom: 10.0),
      child: MaterialButton(
        minWidth: 160,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 5),
        onPressed: onPressed,
        color: AppColors.primaryColor,
        textColor: AppColors.white,
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
