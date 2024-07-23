import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/language/widget/CustomeBottoneLang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/localization/change_lacal.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar:  CustomFisrtAppBar(onPressed: (){},),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:
        GetBuilder<LocalController>(builder:(controller) => 
         Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            const Text(
              "Gym and Spy",
              style: Styles.style50,
            ),
            //      const  SizedBox(height: 20,),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            SizedBox(
              width: 238, //////////////////////////////
              child: Column(
                children: [
                  CustomeBottoneLang(
                    langName: "العربية",
                    textcolor: controller.select == 1 ? ColorApp.white : null,
                    backgroundcolor: controller.select == 1 ? ColorApp.kPrimaryColor : null,
                    onPressed: () {
                      controller.selectLang(1);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomeBottoneLang(
                    textcolor: controller.select == 2 ? ColorApp.white : null,
                    backgroundcolor: controller.select == 2 ? ColorApp.kPrimaryColor : null,
                    langName: "الانجليزية",
                    onPressed: () {
                     controller.selectLang(2);
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              text: "التالي",
              onPressed: controller.select == 0 ? null : () {
               controller.gotoOnboarding();
              },
            ),
           const SizedBox(height: 32,)
          ],
        ),
      ),
      ),
    );
  }
}
