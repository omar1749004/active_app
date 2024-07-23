import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.vertical = 16,
      this.radius = 32,});
  final String text;
  final void Function()? onPressed;
  final double vertical;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: const BorderSide(
            color: ColorApp.kPrimaryColor, // Adjust border color as needed
            width: 2,
          )),
      padding: EdgeInsets.symmetric(vertical: vertical),
      onPressed: onPressed,
      color: onPressed != null ? ColorApp.kPrimaryColor : Colors.white,
      // highlightColor: Colors.red,
      // splashColor: Colors.yellow,
    //  / textColor: ColorApp.kPrimaryColor,
      child: Text(
        text,
        style: Styles.style16.copyWith(color: onPressed == null ? ColorApp.kPrimaryColor : Colors.white),
      ),
    );
  }
}
