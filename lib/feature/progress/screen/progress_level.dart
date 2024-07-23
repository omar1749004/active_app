import 'package:active_app/controller/progress_level_controller.dart';
import 'package:active_app/feature/progress/widget/simple_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressLevel extends StatelessWidget {
  const ProgressLevel({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProgressLevelControllerImp());
    return Scaffold(
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ProgressLevelControllerImp>(
          builder: (controller) {
            return SimpleProgressPage(mainTitle: "تابع مستوي تقدمك",
             showOffer: "شاهد العروض المتاحة",
              prigressDay: "تقدمك اليومي");
          },
        ),
      ),
    );
  }
}







