import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CustomPhysicalInfoDisplay extends StatelessWidget {
  const CustomPhysicalInfoDisplay(
      {super.key, required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorApp.kPrimaryColor)),
      child: Column(
        children: [
          Text(
            title,
            style: Styles.style24A.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            body,
            style: Styles.style20.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
