import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';


class CustomBottoneAuth extends StatelessWidget {
  const CustomBottoneAuth({super.key, this.ontap, required this.text});
  final Function()? ontap;
  final String text ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
       
        decoration: BoxDecoration(
          color: ColorApp.kPrimaryColor ,
          borderRadius: BorderRadius.circular(32)
        ),
        height: 50,
        child: Center(child: Text(text,
        style:const TextStyle(color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500
        ),
        ),),
        ),
    );
  }
}