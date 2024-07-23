import 'package:active_app/controller/add_males_controller.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/nutrition/widget/meal_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMales extends StatelessWidget {
  const AddMales({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddMalesControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<AddMalesControllerImp>(
          builder: (controller) => Form(
            key: controller.formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 24,
                ),
                const CustomHomeTitle(text: "اضافة النظام الغذائي"),
                const SizedBox(height: 16),
                // Meals Header

                // Meals List
                Column(
                  children: List.generate(
                    controller.meals.length,
                    (index) => MealInput(
                      maleNumber: index + 1,
                      meal: controller.meals[index],
                      onRemove: () {
                        controller.meals.removeAt(index);
                        controller.update();
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                // Add Meal Button
                CustomButton(
                  text: "Add Meal",
                  vertical: 12,
                  onPressed: () {
                    controller.meals.add({"mealName": "", "calories": ""});
                    controller.update();
                  },
                ),

                const SizedBox(height: 16),
                // Submit Button
                CustomButton(
                  text: "Submit",
                  vertical: 12,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//CustomTrainerTextForm