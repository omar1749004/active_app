import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/training/widget/custom_redline.dart';
import 'package:active_app/feature/training/widget/custom_training_day_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingWeek extends StatelessWidget {
  const TrainingWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 24,
          ),
         const CustomHomeTitle(
            text: "التمارين",
          ),
          const SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("الاسبوع الحالي",style: Styles.style15,) ,
              Text("الاسبوع القادم" ,style: Styles.style15) ,
            ],
          ),
           const SizedBox(
            height: 23,
          ),
          CustomRedLine(isFirstWeek: true,),
          const SizedBox(
            height: 30,
          ),
          CustomTraineingDayContainer(onTap: () {
            Get.offNamed(AppRoute.trainingDayId);
          },)
        ],
      ),
    );
  }
}
