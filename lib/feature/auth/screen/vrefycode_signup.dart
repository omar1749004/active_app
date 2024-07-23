import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/shared/custom_botton_copy.dart';
import 'package:active_app/feature/auth/widget/cutom_text_body.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/vrefycode_signup.dart';
import '../../../../core/class/handle_data.dart';

class VeryfyCodeSignUp extends StatelessWidget {
  const VeryfyCodeSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VeryfyCodeSignUoCotollerImp());
    return Scaffold(
        appBar: const CustomForgetPassAppBar(
          text: "رمز التحقق",
        ),
        body: GetBuilder<VeryfyCodeSignUoCotollerImp>(
          builder: (controller) => HandlingDataReques(
            statusRequs: controller.statusRequs,
            widget: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                     CusromTextBody(
                        title: "ارسلنا لك رسالة علي اميل ${controller.email}"),
                    const SizedBox(
                      height: 60,
                    ),
                    OtpTextField(
                        fieldWidth: 50,
                        numberOfFields: 5,
                        borderColor: ColorApp.kPrimaryColor,
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled

                        onSubmit: (String verfycode) {
                          controller.vrifiCode = verfycode;
                          Get.offNamed(AppRoute.resetId,
                              arguments: {"email": "email"});
                          // controller.gotoResetPass();
                        }),
                    const SizedBox(
                      height: 60,
                    ),
                    if(controller.endCounter)
                     CustomBotton1(ontap: (){
                      controller.resend();
                     }, text: "resend", color: ColorApp.kPrimaryColor,marginTop: 0,)
                    else 
                     CusromTextBody(title: "استعيد الكود في ${controller.counter}s"),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
