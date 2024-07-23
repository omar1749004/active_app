import 'package:active_app/api_link.dart';
import 'package:active_app/controller/branch_details_controller.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GallarySection extends GetView<BranchDetailsControllerImp> {
  const GallarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child:
              // controller.getSelectedImagePath(
              //       controller.selectedImageIndex) != "empty" ?
              CachedNetworkImage(
            imageUrl:
                "$linkImageUpload/${controller.getSelectedImagePath(controller.selectedImageIndex)}",
            width: 122,
            height: 108,
            key: ValueKey(controller.selectedImageIndex),
          ),
        ),
        //    Image.asset(
        //     ImageAsset.branchImage,
        //     height: 300,
        //     width: 300,
        //     key: ValueKey(controller.selectedImageIndex),
        //   ),
        // ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            //3,
            controller.imagePaths.length,
            (index) => GestureDetector(
              onTap: () => controller.selectImage(index),
              child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: controller.selectedImageIndex == index
                          ? ColorApp
                              .kPrimaryColor // Highlight the selected image
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child:
                      // controller.getSelectedImagePath(
                      // index) != "empty" ?
                      CachedNetworkImage(
                          imageUrl:
                              "$linkImageUpload/${controller.getSelectedImagePath(controller.selectedImageIndex)}",
                          fit: BoxFit.cover)
                  // Image.asset(
                  //   controller.getSelectedImagePath(index),
                  //   fit: BoxFit.cover,
                  // ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
