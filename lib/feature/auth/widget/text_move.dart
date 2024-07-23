import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class TextMove extends StatelessWidget {
  const TextMove({super.key, required this.text, required this.text2, this.ontap});
  final String text ;
  final String text2 ;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    text2,
                    style: Styles.style15G2W4.copyWith(color:const Color(0xff9E9E9E)),
                  ),
                  GestureDetector(
                    onTap:ontap,
                    child:  Text(
                      text,
                      style:const TextStyle(color: ColorApp.kPrimaryColor)
                    ),
                  )
                ],
           );
  }
}