import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/checkinternet.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/data/models/brach_model.dart';
import 'package:active_app/data/service/remote/bransh_data.dart';
import 'package:get/get.dart';

abstract class BranshSelectionController extends GetxController {
  void view();
  void organizeImage();
  void selectBransh(BranchModel branch,int index); 
  void goTobrnchDetails() ;
}

class BranshSelectionControllerImp extends BranshSelectionController {
  List<BranchModel> barnchmodelList = [];
  List<BranchImageModel> barnchImageModelList = [];
  Map<int, List<String>> imageMap = {};
  int branchIndex = -1 ; 
  late BranchModel  branchModel  ;
  StatusRequest statusRequs = StatusRequest.none;
  @override
  void onInit() {
    view();

    super.onInit();
  }

  @override
  void view() async {
    statusRequest(StatusRequest.loading);
    // update();
    if (await checkinternet()) {
      var res = await BranchData().view();
      if (res["status"] == "success") {
        List branshData = res["barnsh"];
        List branshImages = res["barnsh_image"];
        barnchmodelList.addAll(branshData.map((e) => BranchModel.fromJson(e)));
        barnchImageModelList
            .addAll(branshImages.map((e) => BranchImageModel.fromJson(e)));
        organizeImage();
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
  void organizeImage() {
    for (var barnchImage in barnchImageModelList) {
      imageMap[barnchImage.branchId] ??= [];
      imageMap[barnchImage.branchId]!.add(barnchImage.branchImage);
    }
  }
  
  @override
  void selectBransh(BranchModel branch,int index) {
    branchIndex = index ;
    branchModel = branch ;
    update();
  }
  
  @override
  void goTobrnchDetails() {
    Get.toNamed(AppRoute.branshDetailsId,arguments: {
      "branchModel" : branchModel,
      "images" : imageMap[branchModel.branchId]
    });
  }
}
