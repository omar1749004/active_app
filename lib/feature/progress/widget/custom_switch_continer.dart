import 'package:active_app/controller/progress_level_controller.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSwitchContainer extends GetView<ProgressLevelControllerImp> {
  const CustomSwitchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      width: 30,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: controller.currentWiget == 0
                            ? ColorApp.kPrimaryColor
                            : ColorApp.gray3,
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                   AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      width: 30,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: controller.currentWiget == 1
                            ? ColorApp.kPrimaryColor
                            : ColorApp.gray3,
                      ),
                    )
                  ],
                );
  }
}