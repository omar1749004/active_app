import 'package:active_app/controller/training_week_controller.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/training/widget/custom_redline.dart';
import 'package:active_app/feature/training/widget/training_day_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingWeek extends StatelessWidget {
  const TrainingWeek({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrainingWeekControllerImp());
    return Scaffold(
      body: GetBuilder<TrainingWeekControllerImp>(
        builder: (controller) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(
              height: 24,
            ),
             CustomHomeTitle(
              text: "التمارين - ${controller.weekData?["trainingWeek_name"] ?? ""}",

            ),
            const SizedBox(
              height: 23,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "الاسبوع الحالي",
                  style: Styles.style15,
                ),
                Text("الاسبوع القادم", style: Styles.style15),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            CustomRedLine(
              isFirstWeek: controller.isComplete % 2 == 0 ? true : false,
            ),
            const SizedBox(
              height: 30,
            ),
            TrainingDayList()
          ],
        ),
      ),
    );
  }
}
