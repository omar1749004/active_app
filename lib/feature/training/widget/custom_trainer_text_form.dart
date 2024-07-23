import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTrainerTextForm extends StatelessWidget {
  const CustomTrainerTextForm(
      {super.key, this.maxLines = 1, this.label,  this.isNumber = true});
  final int? maxLines;
  final String? label;
  final bool isNumber;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        labelText: label,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorApp.gray2),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
