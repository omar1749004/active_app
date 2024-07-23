import 'package:active_app/controller/home_controller.dart';
import 'package:active_app/core/class/handle_data.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/home/widget/custom_physical_info_diplay.dart';
import 'package:active_app/feature/home/widget/custom_task_box.dart';
import 'package:active_app/feature/home/widget/subscription_info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
   //  Get.find<HomeControllerImp>();
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  CustomHomeTitle(
                    text: title,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPhysicalInfoDisplay(
                        title: "الطول",
                        body: controller.tall.text,
                      ),
                      CustomPhysicalInfoDisplay(
                        title: "الوزن",
                        body: controller.weight.text,
                      ),
                      CustomPhysicalInfoDisplay(
                        title: "الدهون",
                        body: controller.fat.text,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const CustomHomeTitle(
                    text: "الايام المتبقية لديك",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            HandlingDataReques(
              statusRequs: controller.statusRequs,
              widget: SubscriptionInfoCard(
                sessionsAttended:
                    controller.renewModel?.renewalSessionAttend ?? 0,
                sessionsRemaining:
                    (controller.renewModel?.sessionsNumber ?? 0) -
                        (controller.renewModel?.renewalSessionAttend ?? 0),
                startDate: controller.renewModel?.renewalStart
                        ?.toString()
                        .substring(0, 11) ??
                    'N/A',
                endDate: controller.renewModel?.renewalEnd
                        ?.toString()
                        .substring(0, 11) ??
                    'N/A',
                daysRemaining: controller.calculateDaysRemaining(controller.renewModel?.renewalEnd),
                onTap: () async {},
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHomeTitle(
                    text: "مهامك اليوم",
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  CustomTaskBox(
                    image: ImageAsset.onboardingImageOne,
                    textOne: "التمرين",
                    textTow: "ابدا تمرينة اليوم",
                    textTree: "عرض التمرين",
                    icon: Icons.fitness_center,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTaskBox(
                    image: ImageAsset.onboardingImageOne,
                    textOne: "التغذية",
                    textTow: "اطلع عن النظام الغذائي",
                    textTree: "عرض النظام الغذائي",
                    icon: Icons.restaurant,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 28,
            ),
          ],
        ),
        // /),
      ),
    );
  }
}



// Container(
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
//             height: 200,
//             decoration: BoxDecoration(
//                 border: Border.all(color: ColorApp.kPrimaryColor),
//                 borderRadius: BorderRadius.circular(5)),
//             child: Stack(
//               children: [
//                 // Top-left container
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   child: Text(
//                     "عدد الجلسات التي حضرتها \n10",
//                     style: Styles.style15G2,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 // Top-right container
//                 Positioned(
//                   top: 0,
//                   right: 0,
//                   child: Text(
//                     "عدد الجلسات المتبقية\n10",
//                     style: Styles.style15G2,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 // Bottom-left container
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   child: Text(
//                     "تاريخ النهاية \n22/7",
//                     style: Styles.style15G2,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 // Bottom-right container
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: Text(
//                     "تاريخ البداية \n22/7",
//                     style: Styles.style15G2,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 // Center container
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "عدد الايام المتبقية \n30",
//                     style: Styles.style15G2.copyWith(fontSize: 20),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//           ),

