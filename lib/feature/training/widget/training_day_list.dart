import 'package:active_app/controller/training_week_controller.dart';
import 'package:active_app/feature/training/widget/custom_training_day_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingDayList extends GetView<TrainingWeekControllerImp> {
  const TrainingDayList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.trainingDayModellList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: CustomTraineingDayContainer(
                onTap: () {
                  controller.gotoTrainingDay(
                      controller.trainingDayModellList[index].trainingdayId,
                      index);
                },
                trainingDayModel: controller.trainingDayModellList[index],
                nameDay: controller.getDayName(index),
                isComplete: controller.days > index ? true : false,
              ));
        });
  }
}
