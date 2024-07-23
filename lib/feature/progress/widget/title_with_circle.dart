import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class TitleWithCircleWidget extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  final Color circleColor;

  const TitleWithCircleWidget({
    super.key,
    required this.title1,
    required this.title2,
    required this.circleColor,
    required this.title3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title1, style: Styles.style15B),
        const SizedBox(height: 8), // Adjust spacing between title and circle
        Container(
          padding: const EdgeInsets.all(8),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: circleColor, width: 5),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title2, style: Styles.style18BW5),
                Text(title3, style: Styles.style15G2W7),
              ],
            ),
          ),
        ),
      ],
    );
  }
}