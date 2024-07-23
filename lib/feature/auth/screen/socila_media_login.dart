import 'package:active_app/controller/auth/soclial_media_controller.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/auth/widget/divider_of_auth.dart';
import 'package:active_app/feature/auth/widget/social_media_bottom.dart';
import 'package:active_app/feature/auth/widget/text_move.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/class/handle_data.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<SocialControllerImp>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body:
          //  WillPopScope(
          //   onWillPop: alertExiteApp,
          //   child:
          GetBuilder<SocialControllerImp>(
        builder: (controller) => HandlingDataReques(
          statusRequs: controller.statusRequs,
          widget:
           Container(
            padding:
            
             const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //  SizedBox(height: 120,) ,
                const Text(
                  "سجل الان",
                  style: Styles.style48,
                  textAlign: TextAlign.center,
                ),

                const Text(
                  "Gym and Spy",
                  style: Styles.style25,
                  textAlign: TextAlign.center,
                ),
                //  "سجل باستخدام الفيسبوك"
                Column(
                  children: [
                    SocialMediaBottom(
                      text: "سجل باستخدام الفيسبوك",
                      imageName: ImageAsset.facebook,
                      onPressed: () {
                        controller.signInWithFacebook() ;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     SocialMediaBottom(
                        text: "سجل باستخدام جوجل",
                        imageName: ImageAsset.google ,
                        onPressed: (){
                          controller.signInWithGoogle();
                        },
                        ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SocialMediaBottom(
                        text: "سجل باستخدام ابل", imageName: ImageAsset.apple),
                    const SizedBox(
                      height: 30,
                    ),
                    const DividerOfAuth(text: "او"),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.25), // Shadow color
                            offset:const Offset(0, 4), // Shadow position (x, y)
                            blurRadius: 20, // Blur effect
                            spreadRadius: 6, // Spread radius
                          ),
                        ],
                      ),
                      child: CustomButton(
                          text: "سجل الان",
                          onPressed: () {
                            controller.gotologin();
                          }),
                    )
                  ],
                ),

                TextMove(
                    text2: "لا تملك حساب ؟ ",
                    text: "انشا حسابك",
                    ontap: () {
                      controller.gotosignup();
                    })
              ],
            ),
          ),
          // )
        ),
      ),
    );
  }
}




//"Sign Up"
//"don't have an account ?"

