import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/auth/widget/custome_bottone_auth.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/success_signup_controller.dart';
import '../../../core/constant/color.dart';

class SuccessResetPass extends StatelessWidget {
  const SuccessResetPass({super.key});
  @override
  Widget build(BuildContext context) {
    SuccessSignupControllerImp controller =
        Get.put(SuccessSignupControllerImp());
    return Scaffold(
      appBar:const CustomForgetPassAppBar(
        text: "Success",
      ),
      body: Container(
        padding:const EdgeInsets.all(15),
        child: Column(
          children: [
           const Center(
                child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: ColorApp.kPrimaryColor,
            )),
           const Text(
              "سجل الان",
              style: Styles.style48,
            ),
           const SizedBox(
              height: 10,
            ),
           const Text(
              "Password has been reset successfully",
              style: TextStyle(color: ColorApp.gray),
            ),
           const Spacer(),
            Container(
                width: double.infinity,
                child: CustomBottoneAuth(
                  text: "Go To Login",
                  ontap: () {
                    controller.gotologin();
                  },
                )),
           const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
