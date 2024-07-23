import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class DividerOfAuth extends StatelessWidget {
  const DividerOfAuth({
    super.key, required this.text,
  });
 final String text ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       const Expanded(
          child: Divider(
            color: Color(0xffEEEEEE),
           endIndent: 16,
           indent: 10,
          ),
        ),
        Text(text, style: Styles.style18.copyWith(color: ColorApp.gray),),
       const  Expanded(
          child: Divider(
            color: Color(0xffEEEEEE),
           indent: 16,
           endIndent: 10,
          ),
        ),
      ],
    );
  }
}