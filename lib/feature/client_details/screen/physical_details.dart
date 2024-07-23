import 'package:active_app/controller/physical_detail_controller.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/functions/validate_input.dart';
import 'package:active_app/feature/auth/widget/custome_bottone_auth.dart';
import 'package:active_app/feature/client_details/widget/custom_input_details.dart';
import 'package:active_app/feature/language/widget/custom_first_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhysicalDetails extends StatelessWidget {
  const PhysicalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PhysicalDetailsControllerImp());
    return Scaffold(
      appBar: const CustomFisrtAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: GetBuilder<PhysicalDetailsControllerImp>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //   CustomInputDetails(text: "ادخل عمرك"),
                          //  const SizedBox(
                          //       width:
                          //           24),
                          CustomInputDetails(
                            text: "ادخل طولك",
                            myController: controller.tall,
                            validator: (val) {
                              return validInput(val!, 1, 6, "number");
                            },
                          ),
                          const SizedBox(
                              width:
                                  80), // Adjust the width according to your preference
                          CustomInputDetails(
                              text: "ادخل وزنك",
                              myController: controller.weight,
                              validator: (val) {
                              return validInput(val!, 1, 6, "number");
                            },
                              ),
                        ],
                      ),
                      const SizedBox(
                        height: 84,
                      ),
                      const Text(
                        "ادخل نسبة الدهون والعضلات",
                        style: Styles.style30,
                        textAlign: TextAlign.center,
                        
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        "اختياري...",
                        style: Styles.style20,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomInputDetails(
                              text: "نسبة الدهون",
                              myController: controller.fat,
                              validator: (val) {
                                if(val != ""){
                                   return validInput(val!, 1, 3, "ratio");
                                }else{
                                  return null ;
                                }
                              
                            },
                              ),
                          const SizedBox(width: 80),
                          CustomInputDetails(
                              text: "نسبة العضلات",
                              myController: controller.muscle,
                              validator: (val) {
                               if(val != ""){
                                   return validInput(val!, 1, 3, "ratio");
                                }else{
                                  return null ;
                                }
                            },),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 155,
                child: CustomBottoneAuth(
                  text: "التالي",
                  ontap: () {
                    controller.addDetails();
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
