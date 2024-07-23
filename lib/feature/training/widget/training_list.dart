import 'package:active_app/feature/training/widget/custom_training_container.dart';
import 'package:flutter/material.dart';

class TrainingList extends StatelessWidget {
  const TrainingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     itemCount: 6,
     shrinkWrap: true, // مهم
        physics:const NeverScrollableScrollPhysics(),
     
          itemBuilder: (context , index){
       return  Padding(
         padding:  EdgeInsets.only(bottom: 18),
         child: CustomTrainingContainer()
       );
     }
      );
  }
}