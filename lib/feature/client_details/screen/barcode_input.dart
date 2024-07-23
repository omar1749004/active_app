import 'package:active_app/controller/barcode_controller.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/auth/widget/cutom_text_body.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class BarcodeInput extends StatelessWidget {
  const BarcodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BarocdeControllerImp()) ;
    return Scaffold(
      appBar: const CustomForgetPassAppBar(
        text: "ادخل الباركود الخاص بك",
      ),
      body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
        child:GetBuilder<BarocdeControllerImp>(builder: (controller) =>  Column(
          children: [
            Expanded(
              child: ListView(
                
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  const CusromTextBody(title: "ادخل رمز الدخول او الباركود"),
                  const SizedBox(
                    height: 50,
                  ),
                  OtpTextField(
                      fieldWidth: 60,
                      numberOfFields: 5,
                      borderColor: ColorApp.kPrimaryColor,
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
        
                      onSubmit: (String verfycode) {
                        controller.barcodeNum = verfycode ;
                        controller.verfyBarcode();
                      }),
                ],
              ),
            ),
            CustomButton(
              text: "دخول",
              onPressed: () {
                Get.toNamed(AppRoute.barcodeInputId);
              },
            ),
          const  SizedBox(height: 32,)
          ],
        ),
        ),
      ),
    );
  }
}
