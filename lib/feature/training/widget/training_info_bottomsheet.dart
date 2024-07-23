import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/training/widget/important_card.dart';
import 'package:active_app/feature/training/widget/step_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>trainingInfoBottomSheet(){
    Get.bottomSheet(
                isScrollControlled: true,
                Container(
                  width: double.infinity,
                  height: 700,
                  // You can customize the appearance of your bottom sheet here
                  decoration:const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const CustomHomeTitle(
                            text: "Bench press",
                          ),
                        const  SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.asset(
                              ImageAsset.onboardingImageThree,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                         const SizedBox(
                            height: 20,
                          ),
                          Text(
                              "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو ",
                              style: Styles.style15G2.copyWith(fontSize: 12),
                              ) ,
                                      
                        const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text("كيفية تنفيذ التمرين ؟" ,style:Styles.style16.copyWith(
                              color: Colors.black) ,),
                            
                          ),
                        const SizedBox(
                            height: 15,
                          ),
                         const StepList(),
                         
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text("لازم تاخد بالك !" ,style:Styles.style16.copyWith(
                              color: Colors.black) ,),
                          ),
                        const  SizedBox(
                            height: 15,
                          ),
                       const   ImportantPointCard(),
                         const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
   return Future.value(true);
}