import 'package:active_app/controller/auth/login_controller.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/functions/validate_input.dart';
import 'package:active_app/core/shared/custome_textform_auth.dart';
import 'package:active_app/core/shared/cutom_text_bottom.dart';
import 'package:active_app/feature/auth/widget/custome_bottone_auth.dart';
import 'package:active_app/feature/auth/widget/cutom_signup_social_bottom.dart';
import 'package:active_app/feature/auth/widget/divider_of_auth.dart';
import 'package:active_app/feature/auth/widget/text_move.dart';
import 'package:active_app/feature/language/widget/custom_first_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/class/handle_data.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: const CustomFisrtAppBar(),
        body:
            //  WillPopScope(
            //   onWillPop: alertExiteApp,
            //   child:
            GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataReques(
            statusRequs: controller.statusRequs,
            widget: Form(
                key: controller.formKey,
                child: ListView(
                   padding: const EdgeInsets.symmetric(horizontal: 16,),
                  children: [
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    const Text(
                      "سجل عن طريق \nحسابك",
                      style: Styles.style48,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Gym and Spy",
                      style: Styles.style25,
                      textAlign: TextAlign.center,
                    ),
                   const SizedBox(
                      height: 30,
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
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeTextFormAuth(
                      obscureText: controller.isHidepass,
                      validator: (val) {
                        return validInput(val!, 5, 40, "pass");
                      },
                      myController: controller.password,
                      hintText: "",
                      isShowIcone: true,
                      lableText: "Password",
                      ontap: () {
                        controller.showPassword();
                      },
                      suffixIcon: controller.changeIcone(),
                      icon: Icons.lock,
                    ),
                 const   SizedBox(
                      height: 20,
                    ),
                  
                    CustomBottoneAuth(
                      text: "تسجيل دخول",
                      ontap: () {
                        controller.login();
                      },
                    ),
                   const SizedBox(
                      height: 20,
                    ),
                   CustomTextBottom(text: "هل نسيت كلمة المرور؟" , onTap: (){
                    controller.gotocheckEmail();
                   },) ,
                    const SizedBox(
                      height: 40,
                    ),
                    const DividerOfAuth(text: "او استمر عن طريق"),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       CustomSignupSocailBottom(imageName: ImageAsset.facebook,
                       onPressed: (){
                        controller.signInWithFacebook();
                       },),
                       CustomSignupSocailBottom(imageName: ImageAsset.google,
                       onPressed: (){
                        
                        controller.signInWithGoogle();
                       },),
                       CustomSignupSocailBottom(imageName: ImageAsset.apple,
                       onPressed: (){},),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextMove(
                        text2: "هل لديك حساب ؟ ",
                        text: " سجل الان",
                        ontap: () {
                          controller.gotosignup();
                        })
                  ],
                ),
              ),
           
          ),
          // )
        ));
  }
}


      
