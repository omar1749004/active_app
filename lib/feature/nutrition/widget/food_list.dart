import 'package:active_app/feature/nutrition/widget/custom_food_container.dart';
import 'package:flutter/cupertino.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => Column(
          children: [
            CustomFoodConatiner(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
 
                
