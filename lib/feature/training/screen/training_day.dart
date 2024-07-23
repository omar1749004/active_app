import 'package:active_app/controller/training_controller.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/home/widget/custom_app_bar.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/training/widget/training_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingDay extends StatelessWidget {
  const TrainingDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TrainingControllerImp());
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            ListView(
              children: [
                const SizedBox(
                  height: 24,
                ),
                const CustomHomeTitle(
                  text: "تمرينة اليوم - Eliptical Bike",
                ),
                const SizedBox(
                  height: 23,
                ),
                TrainingList(),
                SizedBox(height: 100,)
              ],
            ),
            Positioned(
              bottom: 32,
              child: SizedBox(
                width: 350,
                child: CustomButton(text: "ابدا التمرين",onPressed: (){},),),
            ),
          ],
        ),
      ),
    );
  }
}




