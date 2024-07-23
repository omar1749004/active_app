import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CustomInputRepet extends StatelessWidget {
  const CustomInputRepet({super.key, required this.textEditingController});
final TextEditingController textEditingController ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
              cursorColor: ColorApp.kPrimaryColor,
              keyboardType : TextInputType.number ,
              style: Styles.style18BW5,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                     horizontal: 10,
                 //     vertical: 5,
                    ),
                    
              focusedBorder: OutlineInputBorder(
            //on focus
            borderSide:const BorderSide(
              color: ColorApp.kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorApp.kPrimaryColor),
            borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorApp.kPrimaryColor),
            borderRadius: BorderRadius.circular(10)),
              ),
            );
  }
}