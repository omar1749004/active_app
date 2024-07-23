import 'package:active_app/controller/fogetpassword/reset_pass_contrller.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/feature/auth/widget/custome_bottone_auth.dart';
import 'package:active_app/feature/auth/widget/cutom_text_body.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/class/handle_data.dart';
import '../../../core/functions/validate_input.dart';
import '../../core/shared/custome_textform_auth.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ResetPassControllerImp());
    return Scaffold(
        appBar: const CustomForgetPassAppBar(
          text: "انشا كلمة المرور",
        ),
        body: GetBuilder<ResetPassControllerImp>(
          builder: (controller) => HandlingDataReques(
            statusRequs: controller.statusRequs,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    SvgPicture.asset(
                      ImageAsset.successImage,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const CusromTextBody(
                        title: "انشا كلمة المرور الجديدة الخاصة بك"),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomeTextFormAuth(
                      obscureText: controller.isHidepass1,
                      validator: (val) {
                        return validInput(val!, 5, 40, "pass");
                      },
                      myController: controller.password,
                      hintText: "",
                      isShowIcone: true,
                      lableText: "Password",
                      ontap: () {
                        controller.showPassword(1);
                      },
                      suffixIcon: controller.changeIcone1(),
                      icon: Icons.lock,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomeTextFormAuth(
                      obscureText: controller.isHidepass2,
                      validator: (val) {
                        return validInput(val!, 5, 40, "pass");
                      },
                      myController: controller.repassword,
                      hintText: "",
                      isShowIcone: true,
                      lableText: "Re Password",
                      ontap: () {
                        controller.showPassword(2);
                      },
                      suffixIcon: controller.changeIcone1(),
                      icon: Icons.lock,
                    ),

                    const SizedBox(
                      height: 130,
                    ),
                    CustomBottoneAuth(
                      text: "استمر",
                      ontap: () {
                        // controller.resetPassword();
                        Get.offNamed(AppRoute.successResetId);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
