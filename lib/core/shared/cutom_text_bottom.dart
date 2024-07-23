import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/cupertino.dart';

class CustomTextBottom extends StatelessWidget {
  const CustomTextBottom({super.key, required this.text, this.onTap});
final String text ;
final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                    onTap: onTap,
                    child:  Text(
                      textAlign: TextAlign.center,
                      text,
                      style: Styles.style16 
                    ),
                  );
  }
}