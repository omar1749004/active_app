import 'package:active_app/controller/on_boarding_controler.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/onboarding/widget/customPadgeView.dart';
import 'package:active_app/feature/onboarding/widget/custom_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class OnBoardingPage extends GetView<OnBoardingControllerImp> {
  const OnBoardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: Column(
          children: [
           const Expanded(
              flex: 6, //مهم
              child:  CusttomPadgeView(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                     const  Spacer(
                      flex: 2,
                    ),
                  const  CusttomControler(),
                  const  Spacer(
                      flex: 2,
                    ),
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal:16),
                      child: CustomButton(
                        text: "التالي",
                        onPressed: (){
                      controller.next();
                        },
                      ),
                    ),
                  const  SizedBox(
                      height: 32,
                    ),
                  ],
                ))
          ],
        ));
  }
}
