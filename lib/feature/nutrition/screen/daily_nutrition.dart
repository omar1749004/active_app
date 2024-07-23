import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/nutrition/widget/food_list.dart';
import 'package:flutter/material.dart';

class DailyNutrition extends StatelessWidget {
  const DailyNutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 24,),
                CustomHomeTitle(text: "تمتع بنظامك الغذائي"),
                SizedBox(height: 26,),
                FoodList()
              ],
            ),
          )
        ],),
      ),
    );
  }
}