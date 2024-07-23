import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/training/widget/custom_trainer_text_form.dart';
import 'package:flutter/material.dart';


class MealInput extends StatelessWidget {
  final Map<String, dynamic> meal;
  final VoidCallback onRemove;
  final int maleNumber;

  const MealInput(
      {super.key,
      required this.meal,
      required this.onRemove,
      required this.maleNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          "الوجبة $maleNumber",
          style: Styles.style15B,
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Meal Name
            Expanded(
                flex: 2,
                child: CustomTrainerTextForm(
                  maxLines: null,
                  label: "الوصف",
                  isNumber: false,
                )),
            const SizedBox(width: 16),
            // Calories
            Expanded(
                flex: 1,
                child: CustomTrainerTextForm(
                  maxLines: null,
                  label: "الكالوري",
                )),
            // Remove Button
            IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: onRemove,
            ),
          ],
        ),
      ],
    );
  }
}