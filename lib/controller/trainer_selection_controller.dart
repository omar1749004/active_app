import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/checkinternet.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/data/models/trainer_model.dart';
import 'package:active_app/data/service/remote/client_captin_data.dart';
import 'package:get/get.dart';

abstract class TrainerSelectionController extends GetxController{
  void  getTrainer();
  void selectCaptins(int id,int index) ;
  void goTobarcode() ;
}

class TrainerSelectionControlllerImp extends TrainerSelectionController {
  
  late int barnchId ; 

  late int captinId ;
  int captinIndex = -1 ;
  List<TrainerModel> trainerModelList = [] ;
  StatusRequest statusRequs = StatusRequest.none;

  @override
  void onInit() {
     barnchId = Get.arguments["id"] ;
     
      getTrainer();
    super.onInit();
  }
  
  @override
  void getTrainer() async{
    statusRequest(StatusRequest.loading);
    // update();
    if (await checkinternet()) {
      var res = await ClientCaptinData().getCaptins(
        {
          "branch_id" : barnchId.toString()
        }
      );
      if (res["status"] == "success") {
        List data = res["data"];
        trainerModelList.addAll(data.map((e) => TrainerModel.fromJson(e)));
        statusRequest(StatusRequest.success);
        // data.addAll();
      } else if (res["status"] == "failure") {
        statusRequest(StatusRequest.failure);
      }
    } else {
      statusRequest(StatusRequest.offlineFailure);
    }
    update();
  }
  @override
  void selectCaptins(int id,int index) {
    captinId = id ;
    captinIndex = index ;
    update();
  }
  
  @override
  void goTobarcode() {
    Get.toNamed(AppRoute.barcodeInputId ,arguments: {
      "captinId" :captinId,
      "branchId" : barnchId,
    }) ;
  }


}