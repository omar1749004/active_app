import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  final int stepNumber;
  final String stepText;

 const StepWidget({
    required this.stepNumber,
    required this.stepText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.kPrimaryColor,
        borderRadius: BorderRadius.circular(10), 
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration:const BoxDecoration(
              color: Colors.white, 
              shape: BoxShape.circle,
            ),
            child: Text(
              stepNumber.toString(),
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: ColorApp.kPrimaryColor, 
              ),
            ),
          ),
         const SizedBox(width: 10),
          Expanded(
            child: Text(
              stepText,
              style:const TextStyle(
                fontSize: 14,
                color: Colors.white, // Customize color as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
