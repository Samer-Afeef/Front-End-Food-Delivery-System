import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final AutovalidateMode? validateMode;
  final int? maxLen;

  final TextEditingController myController;
  final String? Function(String?) valid;

  const CustomTextFormAuth(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.suffixIcon,
      required this.myController,
      required this.keyboardType,
      required this.obscureText,
      required this.valid,this.maxLen, this.validateMode,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        autovalidateMode:validateMode,
        maxLength: maxLen,
        validator: valid,
        cursorColor: AppColors.primaryColor,
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: myController,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labelText)),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
