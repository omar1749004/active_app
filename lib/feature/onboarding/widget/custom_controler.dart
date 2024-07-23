import 'package:active_app/controller/on_boarding_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../data/service/static/static.dart';

class CusttomControler extends StatelessWidget {
  const CusttomControler({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller){
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...List.generate(
        onBoardingList.length,
        (index) => AnimatedContainer(
          duration:const Duration(
            milliseconds: 200,
          ),
          margin:const EdgeInsets.only(right: 5),
          width: controller.currentPage ==index ?25 :5,
          height: 6,
          decoration: BoxDecoration(
            color: controller.currentPage == index ? null : const Color(0xFFE0E0E0),
    gradient: controller.currentPage == index
        ?const LinearGradient(
            colors: [
              Color(0xFF034EA2),
              Color(0xFF313130),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )
        : null,

              borderRadius: BorderRadius.circular(8)),
        ),
      ),
      
    ],);
    },);
  }
}
