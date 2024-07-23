import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFoodConatiner extends StatelessWidget {
  const CustomFoodConatiner({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                   onTap: (){
                    Get.toNamed(AppRoute.foodIngredientsId);
                   },
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorApp.gray3),
                      borderRadius: BorderRadius.circular(5) ,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                    child: Row(
                      children: [
                         ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                           child: Image.asset(ImageAsset.food, width: 110, height: 103,
                           fit: BoxFit.fill,
                           ),
                         ),
                        const SizedBox(width: 16,),
                         Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Text("وجبة العشاء", style: 
                             Styles.style18.copyWith(color: Colors.black),),
                             Text("200 سعرة", style: 
                             Styles.style15G2),
                         
                           ],
                         ),
                       const  Spacer(),
                        const  Icon(
                    Icons.check_circle,
                    color: ColorApp.kPrimaryColor,
                  ),
                      ],
                    ),
                  ),
                );
  }
}