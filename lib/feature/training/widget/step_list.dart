import 'package:active_app/core/shared/custom_step.dart';
import 'package:flutter/cupertino.dart';

class StepList extends StatelessWidget {
  const StepList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => Column(
          children: [
            StepWidget(
              stepNumber: index,
              stepText: "كيفية كيفية  كيفية كيفية كيفية",
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
 