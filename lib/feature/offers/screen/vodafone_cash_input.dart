import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:flutter/material.dart';
import '../../../core/functions/validate_input.dart';
import '../../../core/shared/custome_textform_auth.dart';

class VodafoneCashInput extends StatelessWidget {
  const VodafoneCashInput({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), // Adjust the radius as needed
            bottomRight: Radius.circular(20), // Adjust the radius as needed
          ),
        ),
        foregroundColor: Colors.white,
        title: const Text("فودافون كاش"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          // key: controller.formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                   const CustomHomeTitle(text: "ادخل رقم الهاتف"),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomeTextFormAuth(
                      validator: (val) {
                        return validInput(val!, 5, 40, "phone");
                      },
                      //myController: controller.password,
                      hintText: "",
                      lablePading: 0,
                      isPhoneNumber: true,
                      isShowIcone: false,
                      lableStyle: Styles.style15G2W7,
                      lableText: "قم بادخال رقم الهاتف هنا",
                      ontap: () {
                        // controller.showPassword(1);
                      },
                      //  suffixIcon: controller.changeIcone1(),
                      icon: null,
                    ),
                    
                    const SizedBox(
                      height: 24,
                    ),
                  const  Text("سوف يتم ارسال كود الدفع الي هذا الرقم" , style: Styles.style15W5,)
                  ],
                ),
              ),
             CustomButton(
              vertical: 12,
              text: "تاكيد الدفع ب فودافون كاش",
              onPressed: (){
              }
            ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
