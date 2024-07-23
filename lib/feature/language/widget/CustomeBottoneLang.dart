import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomeBottoneLang extends StatelessWidget {
  const CustomeBottoneLang(
      {super.key,
      required this.langName,
      this.onPressed, this.textcolor, this.backgroundcolor,});
  final String langName;
  final void Function()? onPressed;

  final Color? textcolor ;
  final Color? backgroundcolor ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: backgroundcolor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: ColorApp.kPrimaryColor, // Adjust border color as needed
            width: 1.0,
          )),
      padding:const EdgeInsets.symmetric(vertical: 16),
      onPressed: onPressed,

      // highlightColor: Colors.red,
      // splashColor: Colors.yellow,
      textColor: ColorApp.kPrimaryColor,
      child: Text(
        langName,
        style: Styles.style24.copyWith(color: textcolor),
      ),
    );
  }
}
//"عربي"