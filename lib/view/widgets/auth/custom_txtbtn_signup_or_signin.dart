import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
class CustomTxtBtnSignUpOrSignIn extends StatelessWidget {
  final String textQuestion;
  final String textButton;
  final void Function() onTap;
  const CustomTxtBtnSignUpOrSignIn({Key? key, required this.textQuestion, required this.onTap, required this.textButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text(textQuestion,style: Theme.of(context).textTheme.bodyText2,),
         InkWell(
          onTap: onTap,
          child: Text(textButton,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
