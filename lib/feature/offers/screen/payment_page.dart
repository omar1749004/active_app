import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/feature/home/widget/custom_app_bar.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/offers/widget/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const SizedBox(
                  height: 24,
                ),
                 const CustomHomeTitle(text: "اختر وسيلة الدفع المناسبة لك"),
                  const SizedBox(
                  height: 24,
                ),
               PaymentItem(onTap: ()=> Get.toNamed(AppRoute.vodafoneCashInputId),),
               PaymentItem(),
               PaymentItem(),
          ],
        ),
      ),
    );
  }
}