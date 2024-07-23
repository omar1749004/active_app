import 'package:active_app/controller/branch_details_controller.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/auth/widget/cutom_signup_social_bottom.dart';
import 'package:active_app/feature/client_details/widget/gallary_section.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BranchDetails extends StatelessWidget {
  const BranchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BranchDetailsControllerImp());
    return Scaffold(
      appBar: const CustomForgetPassAppBar(
        text: "معلومات عن الفرع",
      ),
      body:GetBuilder<BranchDetailsControllerImp>( builder: (controller) =>
      Stack(
        children: [
          
             ListView(
              padding:  const EdgeInsets.symmetric(horizontal: 16) ,
              children: [
                const SizedBox(
                  height: 35,
                ),
                GallarySection(),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "معلومات عن الفرع",
                  style: Styles.style20BW7,
                ),
                const SizedBox(
                  height: 15,
                ),
                 Text(
                 controller.branchModel.branchDetailsEn,
                  style: Styles.style16G2W7,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "المواعيد",
                  style: Styles.style20BW7,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      controller.branchModel.branchOpenDayEn,
                      style: Styles.style16G2W7,
                    ),
                    Text(
                       controller.branchModel.branchOpenTime,
                      style: Styles.style16G2W7,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "لينكات النواصل",
                  style: Styles.style20BW7,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomSignupSocailBottom(
                      imageName: ImageAsset.tweeter,
                      onPressed: () {
                        launchUrl(
                          Uri.parse("tel:+01093465022")
                        );
                      },
                    ),
                    CustomSignupSocailBottom(
                      imageName: ImageAsset.insta,
                      onPressed: () {
                        Uri.parse("insat") ;
                      },
                    ),
                    CustomSignupSocailBottom(
                      imageName: ImageAsset.facebook,
                      onPressed: () {
                        Uri.parse("face") ;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 110,
                ),
              ],
            ),
         
          // const SizedBox(
          //   height: 10,
          // ),
          Positioned(
            bottom: 32,
            left: 16,
          right: 16,
            child: CustomButton(
              text: "اختر مدربك",
              onPressed: () {
                controller.goToTrainerSelection();
              },
            ),
          ),
        ],
         ),
      ),
    );
  }
}
