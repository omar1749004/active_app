import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/offers/widget/sub_type_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                   const SizedBox(
                  height: 24,
                ),
                 const CustomHomeTitle(text: "اختر نوع العضوية المناسبة"),
                  const SizedBox(
                  height: 24,
                ),
                 SubscriptionTypeList()
                ],
              ),
            ),
             const SizedBox(
              height: 10,
            ),
            CustomButton(
              vertical: 12,
              text: "تجديد",
              onPressed: (){
                Get.toNamed(AppRoute.paymentPageId);
              }
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
    
  }
}