import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/core/services/paymob/paymob_manager.dart';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/data/models/sub_model.dart';
import 'package:get/get.dart';

abstract class PaymentController extends GetxController {
  void gotoInputNumber();
  void payByCard();
}

class PaymentControllerImp extends PaymentController {
  late SubModel subModel;
  DateTime  ?start = DateTime.now();
  DateTime ?end = DateTime.now();
  PaymobManger paymobManger = PaymobManger();
  StatusRequest statusRequs = StatusRequest.none;
  late int id;
  MyServices services = Get.find();
  @override
  void onInit() {
    id = int.parse(services.sharedPreferences.get("id").toString());
    subModel = Get.arguments["subModel"];
    start = Get.arguments["start"];
    end =Get.arguments["end"] ;

    super.onInit();
  }

  @override
  void gotoInputNumber() {
    Get.toNamed(AppRoute.vodafoneCashInputId,
        arguments: {"subModel": subModel , "id" : id , "start" : start , "end" : end});
  }

  @override
  void payByCard() async {
    statusRequest(StatusRequest.loading);
    String paymentKey = await paymobManger.getPaymentkeyFristThreeStep(
        subModel.subscriptionsPrice, "EGP", subModel.subscriptionsName, {
          "userId" : id ,
          "start" : start ,
          "end" : end
        });
    paymobManger.payCard(paymentKey);
    statusRequest(StatusRequest.success);
  }
}
