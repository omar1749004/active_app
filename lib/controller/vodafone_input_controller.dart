import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/core/services/paymob/paymob_manager.dart';
import 'package:active_app/data/models/sub_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VodafoneInputController extends GetxController {
  void payByVodafone();
}

class VodafoneInputControllerImp extends VodafoneInputController {
  late SubModel subModel;
  DateTime? start = DateTime.now();
  DateTime? end = DateTime.now();
  PaymobManger paymobManger = PaymobManger();
  late TextEditingController phoneNumber;
  StatusRequest statusRequs = StatusRequest.none;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late int id;
  @override
  void onInit() {
    id = Get.arguments["id"];
    subModel = Get.arguments["subModel"];
    start = Get.arguments["start"];
    end = Get.arguments["end"];
    phoneNumber = TextEditingController();
    super.onInit();
  }

  @override
  void payByVodafone() async {
    if (formKey.currentState!.validate()) {
      statusRequest(StatusRequest.loading);
      String paymentKey = await paymobManger.getPaymentkeyFristThreeStep(
          subModel.subscriptionsPrice,
          "EGP",
          subModel.subscriptionsName,
          {"subModel": subModel, "id": id, "start": start, "end": end});
      String url = await paymobManger.mobileWallets(
          paymentKey: paymentKey, phone: phoneNumber.text);
      PaymobManger().payWallet(url);
      statusRequest(StatusRequest.success);
    }
  }
}
