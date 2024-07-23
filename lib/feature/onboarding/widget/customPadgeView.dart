import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/on_boarding_controler.dart';
import '../../../data/service/static/static.dart';

class CusttomPadgeView extends GetView<OnBoardingControllerImp> {
  const CusttomPadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return   PageView.builder(
      controller: controller.pageController,
      onPageChanged :(value) => controller.onChanged(value),
          itemCount: onBoardingList.length,
          itemBuilder: (context ,i){
          return Column(children: [
           
           Image.asset(onBoardingList[i].image!,
           ),
           const SizedBox(height: 50,),
           Container(width: double.infinity,
           alignment: Alignment.center,
            child: Text(onBoardingList[i].body!,textAlign: TextAlign.center,
            style: Styles.style40,),)
          ],);
               },);
        
  }
}