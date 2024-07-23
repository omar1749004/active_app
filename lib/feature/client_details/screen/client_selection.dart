import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/data/models/trainer_model.dart';
import 'package:active_app/feature/client_details/widget/members_selection.dart';
import 'package:flutter/material.dart';

List<TrainerModel> t = [
  TrainerModel(image: ImageAsset.branchImage, name: "omar"),

];

class ClienSelelection extends StatelessWidget {
  const ClienSelelection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container() ;
    // return MembersSelections(
    //   appbarTitle: "المتدربين لديك",
    //   members: t,
    //   nextText: "عرض تفاصيل المتدرب",
    // );
  }
}
