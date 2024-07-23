import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSignupSocailBottom extends StatelessWidget {
  const CustomSignupSocailBottom({
    super.key, this.onPressed,  required this.imageName,
  });
 final void Function()? onPressed ;
 final String imageName ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color:
                      Color(0xffEEEEEE), // Adjust border color as needed
                  width: 1,
                )),
            padding: const EdgeInsets.symmetric(vertical: 14),
            onPressed: onPressed,
            child:SvgPicture.asset(
      imageName,
      width: 25,
    ),
    );
  }
}
