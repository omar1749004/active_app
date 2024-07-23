import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/training/widget/custom_trainer_text_form.dart';
import 'package:flutter/material.dart';

class InputTrainingDetails extends StatelessWidget {
  const InputTrainingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("اضف عدد ",
                    style: Styles.style15B.copyWith(fontFamily: "Cairo")),
                const SizedBox(
                  height: 5,
                ),
                CustomTrainerTextForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
