import 'package:active_app/controller/fogetpassword/check_email_controller.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/auth/widget/custome_bottone_auth.dart';
import 'package:active_app/feature/auth/widget/cutom_text_body.dart';
import 'package:active_app/feature/auth/widget/mian_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handle_data.dart';
import '../../../core/functions/validate_input.dart';
import '../../core/shared/custome_textform_auth.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailControllerImp());

    return Scaffold(
      appBar: const CustomForgetPassAppBar(
        text: "نسيت كلمة المرور",
      ),
      body: GetBuilder<CheckEmailControllerImp>(
        builder: (controller) => HandlingDataReques(
          statusRequs: controller.statusRequs,
          widget: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Expanded(
                    child: Form(
                      key: controller.formKey,
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 69,
                          ),
                          const MainTitle(),
                          const SizedBox(
                            height: 62,
                          ),
                          const CusromTextBody(
                              title:
                                  "اختر طرقة التواصل المناسبة لك لتاكيد كلمة المرور الخاصة بك"),
                          const SizedBox(
                            height: 24,
                          ),
                          CustomeTextFormAuth(
                            validator: (val) {
                              return validInput(val!, 5, 100, "email");
                            },
                            myController: controller.email,
                            hintText: "",
                            lableText: "Email",
                            icon: Icons.email_outlined,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomBottoneAuth(
                    text: "استمر",
                    ontap: () {
                       controller.checkemail();
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomForgetPassAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomForgetPassAppBar({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            text,
            style: Styles.style24,
          ),
        ),
      ],
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: ColorApp.kPrimaryColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
