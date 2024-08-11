import 'package:active_app/controller/offres_controller.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/core/shared/custom_date_field.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:active_app/feature/offers/widget/sub_type_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffresControlllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<OffresControlllerImp>(
          builder: (controller) => Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                  
                    const CustomHomeTitle(text: "اختر نوع العضوية المناسبة"),
                    const SizedBox(
                      height: 24,
                    ),
                     Row(
                     children: [
                   
                       Expanded(
                        flex: 3,
                         child: CustomDateField(
                      label: "تاريخ البداية",
                      borderRadius: 15,
                      fontSize: 15,
                      myController: TextEditingController(
                          text: DateFormat('yyyy-MM-dd')
                              .format(controller.start!)),
                      onChanged: (p0) {
                        controller.start = p0;
                        controller.setEndDate(p0!);
                      },
                      width: 145,
                      height: 50,
                      iconSize: 20,
                    ),
                       ),
                        const  Expanded(
                        flex: 1,
                        child: SizedBox()),
                     ],
                   ),
                   const SizedBox(
                      height: 24,
                    ),
                   Row(
                     children: [
                    const  Expanded(
                        flex: 1,
                        child: SizedBox()),
                       Expanded(
                        flex: 3,
                         child: CustomDateField(
                            label: "تاريخ النهاية",
                            borderRadius: 15,
                            fontSize: 15,
                            width: 145,
                            myController: TextEditingController(
                                text:
                                    DateFormat('yyyy-MM-dd').format(controller.end!)),
                            height: 50,
                            iconSize: 20,
                            isaccess: false,
                          ),
                       ),
                     ],
                   ),
                   const SizedBox(
                      height: 24,
                    ),
                    SubscriptionTypeList(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  vertical: 12,
                  text: "تجديد",
                  onPressed:controller.subindex == -1 ? null : () {
                   controller.gotoPaymentMethod();
                  }),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
