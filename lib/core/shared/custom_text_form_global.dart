import 'package:flutter/material.dart';

import '../../core/constant/app_colors.dart';

class CustomTextFormGlobal extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final AutovalidateMode? validateMode;
  final int? maxLen;
  final TextEditingController myController;
  final String? Function(String?) valid;

  const CustomTextFormGlobal(
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
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor
            ),
            suffixIcon: suffixIcon,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
class CustomTextFormNumbers extends StatelessWidget {
  final String hintText;
  final String labelText;

  final TextEditingController myController;
  final String? Function(String?) valid;

  const CustomTextFormNumbers(
      {Key? key,
        required this.hintText,
        required this.labelText,

        required this.myController,

        required this.valid,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(

        validator: valid,
        cursorColor: AppColors.primaryColor,

        keyboardType:TextInputType.number,
        controller: myController,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 12),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            label: Text(labelText),
            labelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor
            ),

            border: InputBorder.none),
      ),
    );
  }
}


class CustomMultiText extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Widget suffixIcon;
  final int? maxLen;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?) valid;

  final TextEditingController myController;


  const CustomMultiText(
      {Key? key,
        required this.hintText,
        required this.labelText,
        required this.suffixIcon,
        required this.myController,
        this.maxLen, this.maxLines, this.minLines, required this.valid,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        textAlign: TextAlign.start,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLen,
        validator: valid,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.primaryColor,
        controller: myController,
        decoration: InputDecoration(
            hintText:hintText,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labelText)),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),

            )),
      ),
    );
  }
}