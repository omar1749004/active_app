import 'package:active_app/feature/training/widget/custom_input_training_section.dart';
import 'package:flutter/widgets.dart';

class TrainingInputList extends StatelessWidget {
  const TrainingInputList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
        itemCount: 3,
        shrinkWrap: true, // مهم
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CustomInputTrainingSection();
        });
  }
}
