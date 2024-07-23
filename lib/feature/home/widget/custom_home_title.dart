import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CustomHomeTitle extends StatelessWidget {
  const CustomHomeTitle({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w600,
  });

  final String text;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.style20B.copyWith(fontWeight: fontWeight),
    );
  }
}
