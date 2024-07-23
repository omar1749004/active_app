import 'package:active_app/controller/notify_controller.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
        appBar: CustomForgetPassAppBar(text: "اشعارات") ,
        
        body: GetBuilder<NotificationController>(
          builder: (controller) =>
          //  HandlingDataView(
          //   statusRequs: controller.statusRequs,
          //   widget:
             Container(
              padding:const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(children: [
                const SizedBox(
                  height: 10,
                ),
                ...List.generate(
                    8,
                    (index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Stack(children: [
                            ListTile(
                              title: Text(
                                  "controller.data[index][notification_title]"),
                              subtitle: Text(
                                  "controller.data[index][notification_body]"),
                            ),
                            Positioned(
                              right: 5,
                              top: 10,
                              child: Text(
                                // Jiffy.parse(
                                        // controller.data[index]
                                            // ["notification_date"],
                                        // pattern:
                                         'yyyy-MM-dd HH:mm:ss'
                                        //  )
                                    // .fromNow(), 
                                    ,
                                style: Styles.style15,
                              ),
                            )
                          ]),
                        ))
                
              ]),
            ),
          // ),
        ));
  }
}
