import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu(
      {super.key,
      required this.items,
      required this.intialValue,
      this.onChanged,
      this.label = "",
      this.redius = 16});
  final String label;

  final List<String> items;
  final String intialValue;
  final void Function(String?)? onChanged;
  final double redius;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: double.infinity, // Allow it to expand to the parent’s width
        ),
        child: DropdownButtonFormField<String>(
            menuMaxHeight: 150,
            focusColor: const Color.fromARGB(255, 206, 206, 206),
            decoration: InputDecoration(
              labelText: label,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorApp.kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(redius)),
              border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 170, 170, 170)),
                  borderRadius: BorderRadius.circular(redius)),
            ),
            value: intialValue,
            borderRadius: BorderRadius.all(Radius.circular(redius)),
            items: items
                .map((item) =>
                    DropdownMenuItem<String>(value: item, child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(item))))
                .toList(),
            onChanged: onChanged),
      ),
    );
  }
}
