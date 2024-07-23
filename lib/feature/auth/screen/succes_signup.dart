import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/success_signup_controller.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    SuccessSignupControllerImp controller =
        Get.put(SuccessSignupControllerImp());
    return Scaffold(
      appBar: CustomForgetPassAppBar(
        text: "Success",
      ),
      // AppBar(
      //   centerTitle: true,
      //   backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //   elevation: 0.0,
      //   title: Text("Success",style: TextStyle(
      //         fontWeight: FontWeight.w600,
      //         fontSize: 20,
      //         color: Color.fromARGB(255, 94, 89, 89)
      //        ),),
      //   automaticallyImplyLeading: true,
      // ),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Center(
                child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: ColorApp.kPrimaryColor,
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              "سجل الان",
              style: Styles.style48,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "successfully registered",
              style: TextStyle(color: ColorApp.gray),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomButton(
                text: "Go To Login",
                onPressed: () {
                  controller.gotologin();
                },
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 18),
            //     child: CustomBottoneAuth(text: "Go To Login", ontap:() {controller.gotologin();},),
            //   )),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}
