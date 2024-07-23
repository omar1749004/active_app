import 'package:active_app/controller/training_controller.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/training/widget/custom_input_repet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordingGroupsSection extends GetView<TrainingControllerImp> {
  const RecordingGroupsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:const EdgeInsets.all(20),
     
      children:[
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           Text("التكرار" ,style: Styles.style16G2W7.copyWith(color: Colors.black),),
            Text("الوزن",style: Styles.style16G2W7.copyWith(color: Colors.black))
      ],),
         ListView.builder(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: controller.sets,
              itemBuilder: (context, index) {
                return Row(
              //    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                   Container(
            padding: const EdgeInsets.all(8),
            decoration:const BoxDecoration(
              color: ColorApp.kPrimaryColor, 
              shape: BoxShape.circle,
            ),
            child: Text(
             "${index+1}",
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white, 
              ),
            ),
          ),
         const Spacer(flex: 5,),
          SizedBox(
            height: 30,
              width: 40,
            child: CustomInputRepet(textEditingController: controller.repsControllers[index],)
          ),
       const   Spacer(flex: 6,),
          SizedBox(
            height: 30,
            width: 62,
           child: CustomInputRepet(textEditingController: controller.weightControllers[index],)
          ),
        const  Spacer(flex: 4,),
        if(1 == 1)
                const   Icon(
                    Icons.check_circle,
                    color: ColorApp.kPrimaryColor,
                    size: 28,
                  )
        else
     const SizedBox(
        width: 28,
        height: 28,
      ),
               
                  ],
                );
              
              },
            ),
           const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              IconButton(
                icon:const Icon(Icons.add_circle_outline),
                onPressed: controller.addSet,
                iconSize: 35,
                color: Colors.red,
              ),
              IconButton(
                icon:const Icon(Icons.remove_circle_outline),
                onPressed: controller.removeSet,
                iconSize: 35,
                color: Colors.red,
              ),
            ],
          ),
         const SizedBox(height: 16),
          CustomButton(text: "الانتهاء من التمرين", onPressed: (){},vertical: 12,),
      ]
    );
      
    
  }
}