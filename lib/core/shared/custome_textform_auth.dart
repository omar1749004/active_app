import 'package:active_app/core/constant/styles.dart';

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomeTextFormAuth extends StatelessWidget {
  const CustomeTextFormAuth(
      {super.key,
      this.hintText,
      required this.lableText,
      this.myController,
      this.validator,
      this.maxlines = 1,
      this.onChanged,
      this.isShowIcone = false,
      this.suffixIcon,
      this.isPhoneNumber = false,
      this.obscureText = false,
      this.ontap,
      this.focusNode,
      this.fontSize = 16,
      this.lableStyle = Styles.style14B,
      this.onfocuseColor = Colors.black,
      this.cursorColor = ColorApp.kPrimaryColor,
      this.hintColor = Colors.black,
      this.mainTextColor = Colors.black,
      this.isreadonly = false,
      this.onTapOnTextField,
      this.icon,
      this.radius = 12,
      this.iconColor = Colors.black,
      this.lablePading = 20.0});

  final String? hintText;
  final String lableText;
  final IconData? suffixIcon;
  final IconData? icon;
  final TextEditingController? myController;
  final String? Function(String?)? validator;
  final bool isPhoneNumber;
  final bool obscureText;
  final int maxlines;
  final bool isShowIcone;
  final TextStyle? lableStyle;
  final double fontSize;
  final Color onfocuseColor;
  final Color hintColor;
  final Color cursorColor;
  final Color mainTextColor;
  final bool isreadonly;
  final void Function()? ontap;
  final void Function()? onTapOnTextField;
  final void Function(String)? onChanged;
  final double radius;
  final FocusNode? focusNode;
  final Color iconColor;
  final double lablePading;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      focusNode: focusNode,
      onTap: onTapOnTextField,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: isPhoneNumber ? TextInputType.number : TextInputType.text,
      validator: validator,
      controller: myController,
      cursorColor: cursorColor,
      readOnly: isreadonly,
      style: TextStyle(
          fontSize: fontSize,
          color: mainTextColor,
          fontFamily: "NotoSansArabic"),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xffFAFAFA),
        hintStyle: const TextStyle(
            color: Color(0xff9E9E9E), fontFamily: "NotoSansArabic"),
        //hintStyle: TextStyle(fontSize: 14,
        //color: check? ColorApp.KPrimaryColor: color
        // ),

        label: Padding(
          padding: EdgeInsets.all(lablePading),
          child: Text(
            lableText,
            style: lableStyle,
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
        //labelStyle: TextStyle(
        //color: check? ColorApp.KPrimaryColor:color
        // ),

        // floatingLabelBehavior: FloatingLabelBehavior.always,

        // color: check ? ColorApp.KPrimaryColor:color,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),

        //  focusColor: ColorApp.kPrimaryColor,
        focusedBorder: OutlineInputBorder(
            //on focus
            borderSide: BorderSide(
              color: onfocuseColor,
            ),
            borderRadius: BorderRadius.circular(radius)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffFAFAFA)),
            borderRadius: BorderRadius.circular(radius)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffFAFAFA)),
            borderRadius: BorderRadius.circular(radius)),
        prefixIcon: Icon(icon, color: iconColor),
        suffixIcon: isShowIcone
            ? GestureDetector(
                onTap: ontap,
                child: Icon(suffixIcon, color: iconColor),
              )
            : null,
      ),
    );
  }
}
