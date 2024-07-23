import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/data/models/trainer_model.dart';
import 'package:flutter/material.dart';

class CustomTrainerGridView extends StatelessWidget {
  const CustomTrainerGridView({super.key, required this.trainerModel, this.onTap, required this.isTap});
  final TrainerModel trainerModel;
  final void Function()? onTap;
  final bool isTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  ImageAsset.branchImage,
                  width: 183,
                  height: 222,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: Transform.scale(
                  scale: 1.5, 
                  child: Checkbox(
                    visualDensity: VisualDensity.standard,
                      shape: const CircleBorder(),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: ColorApp.kPrimaryColor,
                      value: isTap,
                      side: const BorderSide(color: ColorApp.kPrimaryColor, width: 1),
                      onChanged: (val) {}),
                ),
              )
              // Positioned(
              //     top: 4,
              //     left: 4,
              //     child: Image.asset(
              //       ImageAsset.sale,
              //       width: 50,
              //     ))
            ],
          ),
        Text(trainerModel.name!,style :Styles.style30A)
        ],
      ),
    );
  }
}
