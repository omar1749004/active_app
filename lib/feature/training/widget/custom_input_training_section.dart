import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/training/widget/inputs_training_details.dart';
import 'package:flutter/material.dart';

class CustomInputTrainingSection extends StatelessWidget {
  const CustomInputTrainingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "بنش دكة",
                      style: Styles.style25
                          .copyWith(color: Colors.black, fontFamily: "Cairo"),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    InputTrainingDetails(),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(),
                  ],
                );
  }
}