import 'package:active_app/controller/offres_controller.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/data/models/sub_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionPeriodContainer extends GetView<OffresControlllerImp> {
  const SubscriptionPeriodContainer(this.onTap,
      {super.key, required this.subModel,required this.isTap});
  final SubModel subModel;
  final void Function()? onTap;
  final bool isTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          subModel.subscriptionsName,
          style: Styles.style15B,
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(right: 14, left: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: ColorApp.gray2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    controller.getmonth(subModel.subscriptionsSessionsNumber),
                    // style: Styles.style20B,
                  ),
                ),
                Text(
                  "${subModel.subscriptionsPrice}",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                      shape: const CircleBorder(),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: ColorApp.kPrimaryColor,
                      value: isTap,
                      onChanged: (val){
                         onTap!() ;
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
