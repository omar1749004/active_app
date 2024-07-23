import 'package:active_app/controller/progress_level_controller.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/progress/widget/barchart_card.dart';
import 'package:active_app/feature/progress/widget/custom_back_groun_progress.dart';
import 'package:active_app/feature/progress/widget/custom_switch_continer.dart';
import 'package:active_app/feature/progress/widget/progress_line.dart';
import 'package:active_app/feature/progress/widget/title_with_circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleProgressPage extends GetView<ProgressLevelControllerImp> {
  const SimpleProgressPage(
      {required this.mainTitle,
      required this.showOffer,
      required this.prigressDay,
      super.key});
  final String mainTitle;
  final String showOffer;
  final String prigressDay;
// "شاهد العروض المتاحة"
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomHomeTitle(text: mainTitle),
        ),
        const SizedBox(
          height: 30,
        ),
        CustomBackGrounProgress(
          showOffer: showOffer,
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomHomeTitle(text: prigressDay),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleWithCircleWidget(
                  circleColor: ColorApp.kPrimaryColor,
                  title1: "التمارين",
                  title2: "7",
                  title3: "24",
                ),
                TitleWithCircleWidget(
                  circleColor: Colors.red,
                  title1: "سعرات",
                  title2: "1110",
                  title3: "1900",
                ),
                TitleWithCircleWidget(
                  circleColor: const Color.fromARGB(255, 0, 255, 8),
                  title1: "مدة التمرين",
                  title2: "70",
                  title3: "200",
                ),
              ],
            )),
        const SizedBox(
          height: 39,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ProgressLine(
              progress: 0.7,
            )),
       const SizedBox(height: 24),
        SizedBox(
          height: 270,
          child: PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.change();
            },
            children: [
              BartChartCard(
                  commitmentLevels: [4, 5, 2, 6 ,5,6,], title: "التزام المتدرب"),
              BartChartCard(commitmentLevels: [4, 3, 5, 6], title: "الاوزان"),
            ],
          ),
        ),
        CustomSwitchContainer(),
      const  SizedBox(
          height: 100,
        )
      ],
    );
  }
}
