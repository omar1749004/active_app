import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/core/shared/custom_dropdown_menu.dart';
import 'package:active_app/data/service/static/static.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/training/widget/training_input_list.dart';
import 'package:flutter/material.dart';

class AddTraining extends StatelessWidget {
  const AddTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 24,
          ),
          const CustomHomeTitle(
            text: "تحديد مستوي المتدرب",
          ),
          const SizedBox(
            height: 23,
          ),
          Row(
            children: [
              Expanded(
                child: CustomDropDownMenu(
                    items: trainingLevel, intialValue: trainingLevel[0]),
              ),
              const SizedBox(width: 160),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const Divider(),
          const SizedBox(
            height: 14,
          ),
          const CustomHomeTitle(
            text: "اختار نظام التمرين",
          ),
          const SizedBox(
            height: 23,
          ),
          Row(
            children: [
              Expanded(
                child: CustomDropDownMenu(
                    items: trainingLevel, intialValue: trainingLevel[0]),
              ),
              const SizedBox(width: 160),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const Divider(),
          const SizedBox(
            height: 14,
          ),
          const CustomHomeTitle(
            text: "التمارين",
          ),
          const SizedBox(
            height: 14,
          ),
          const Divider(),
          TrainingInputList(),
          const SizedBox(
                      height: 14,
                    ),
            CustomButton(
              text: "اضافة",
              onPressed: () {

              },
            ),
            const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
