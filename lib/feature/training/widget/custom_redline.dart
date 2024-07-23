import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomRedLine extends StatelessWidget {
  const CustomRedLine({super.key,required this.isFirstWeek});
  final bool  isFirstWeek ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          stops: const [0.5, 0.5],
          colors: isFirstWeek
              ? [Colors.red, ColorApp.gray3]
              : [ColorApp.gray3, Colors.red],
        ),
      ),
    );
  }
}