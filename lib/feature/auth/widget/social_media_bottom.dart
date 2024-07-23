import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaBottom extends StatelessWidget {
  const SocialMediaBottom({
    super.key, this.onPressed, required this.text, required this.imageName,
  });
 final void Function()? onPressed ;
 final String text ;
 final String imageName ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color:
                  Color(0xffEEEEEE), // Adjust border color as needed
              width: 1,
            )),
        padding: const EdgeInsets.symmetric(vertical: 14),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Styles.style16W6.copyWith(color:  ColorApp.kPrimaryColor),
            ),
           const SizedBox(width: 12,),
           SvgPicture.asset(
  imageName,
),
            // Image.asset(imageName)
          ],
        )
        );
  }
}