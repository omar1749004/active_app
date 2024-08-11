import 'package:active_app/controller/payment_controller.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/feature/home/widget/custom_app_bar.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/offers/widget/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentControllerImp());
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<PaymentControllerImp>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const CustomHomeTitle(text: "اختر وسيلة الدفع المناسبة لك"),
              const SizedBox(
                height: 24,
              ),
              PaymentItem(
                onTap: () {
                  controller.gotoInputNumber();
                },
                imageName: ImageAsset.vCash,
                methodName: "فودافون كاش",
              ),
              PaymentItem(
                onTap: () {
                  controller.payByCard();
                },
                imageName: ImageAsset.creaditCard,
                methodName: "كريدت كارد",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
