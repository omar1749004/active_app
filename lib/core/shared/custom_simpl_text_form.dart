import 'package:active_app/core/constant/styles.dart';

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomSimpleTextForm extends StatelessWidget {
  const CustomSimpleTextForm(
      {super.key,
      this.hintText,
      this.myController,
      this.validator,
      this.maxlines = 1,
      this.isShowIcone = false,
      this.isPhoneNumber = false,
      this.obscureText = false,
      this.focusNode,
      this.fontSize = 16,
      this.lableStyle = Styles.style14B,
      this.onfocuseColor = ColorApp.kPrimaryColor,
      this.cursorColor = ColorApp.kPrimaryColor,
      this.hintColor = Colors.black,
      this.mainTextColor = Colors.black,
      this.isreadonly = false,
      this.radius = 12});

  final String? hintText;
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
  final double radius;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      obscureText: obscureText,
      keyboardType: isPhoneNumber ? TextInputType.number : TextInputType.text,
      validator: validator,
      controller: myController,
      cursorColor: cursorColor,
      readOnly: isreadonly,
      style: TextStyle(
        fontSize: fontSize,
        color: mainTextColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        filled: false,
        fillColor: const Color(0xffFAFAFA),
        hintStyle: const TextStyle(
            color: Color(0xff9E9E9E), fontFamily: "NotoSansArabic"),
        //hintStyle: TextStyle(fontSize: 14,
        //color: check? ColorApp.KPrimaryColor: color
        // ),

        // label: Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: Text(
        //     lableText,
        //     style: lableStyle,
        //     softWrap: false,
        //     overflow: TextOverflow.visible,
        //   ),
        // ),
        //labelStyle: TextStyle(
        //color: check? ColorApp.KPrimaryColor:color
        // ),

        // floatingLabelBehavior: FloatingLabelBehavior.always,

        // color: check ? ColorApp.KPrimaryColor:color,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),

        //  focusColor: ColorApp.kPrimaryColor,
        focusedBorder: OutlineInputBorder(
            //on focus
            borderSide: BorderSide(
              color: onfocuseColor,
            ),
            borderRadius: BorderRadius.circular(radius)),
        // border: OutlineInputBorder(
        //     borderSide: const BorderSide(color: ColorApp.gray2),
        //     borderRadius: BorderRadius.circular(radius)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorApp.gray2),
            borderRadius: BorderRadius.circular(radius)),

        border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorApp.gray2),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
