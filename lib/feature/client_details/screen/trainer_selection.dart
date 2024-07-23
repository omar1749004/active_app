import 'package:active_app/controller/trainer_selection_controller.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/data/models/trainer_model.dart';
import 'package:active_app/feature/client_details/widget/members_selection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<TrainerModel> t = [
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
    TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),
];

class TrainerSelection extends StatelessWidget {
  const TrainerSelection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(TrainerSelectionControlllerImp()) ;
    return GetBuilder<TrainerSelectionControlllerImp>(builder: (controller)=>
    MembersSelections(
      appbarTitle: "اختر مدربك الخاص",
      members: controller.trainerModelList,
      nextText: "التالي",
      onTap: (index, id) {
        controller.selectCaptins(id, index);
      },
      selectIndex: controller.captinIndex ,
      onNextPressed: () {
        controller.goTobarcode() ;
      },
    ));
  }
}
