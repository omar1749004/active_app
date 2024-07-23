import 'package:active_app/controller/branch_selection_controller.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/client_details/widget/list_bransh.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BranshSelection extends StatelessWidget {
  const BranshSelection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BranshSelectionControllerImp());
    return Scaffold(
      appBar: const CustomForgetPassAppBar(
        text: "عرض الفروع",
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<BranshSelectionControllerImp>(
          builder: (controller) => Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    ListItemHome()
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: "معلومات عن الفرع",
                onPressed: controller.branchIndex != -1
                    ? () {
                        controller.goTobrnchDetails();
                      }
                    : null,
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
