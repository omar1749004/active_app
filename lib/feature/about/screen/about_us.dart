import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/auth/widget/cutom_signup_social_bottom.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const CustomForgetPassAppBar(
        text: "معلومات عنا",
      ),
      body: Stack(
        children: [
          ListView(
             padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(
                  height: 24,
                ),
               Image.asset(
                        ImageAsset.branchImage,
                        height: 300,
                        width: 300,
                      ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق",
                  style: Styles.style16G2W7,
                ),
                 const SizedBox(
                  height: 38,
                ),
                const Text(
                  "بيانات التواصل",
                  style: Styles.style20BW7,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  const  Icon(Icons.phone,color: ColorApp.kPrimaryColor,),
                const  SizedBox(width: 20,),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            launchUrl(
                          Uri.parse("tel:+01093465022")
                        );
                          },
                          child: Text(
                            "+966577662779",
                            style: Styles.style15A.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                       const  SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                           launchUrl(
                          Uri.parse("tel:+01093465022")
                        );
                          },
                          child: Text(
                            "+966577662779",
                            style: Styles.style15A.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),//+966577662779
                   const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  const  Icon(Icons.email,color: ColorApp.kPrimaryColor,),
                const  SizedBox(width: 20,),
                    Text(
                      "info @gaint-whles.com",
                      style: Styles.style15A.copyWith(fontWeight: FontWeight.w700),
                    ),
                   const Spacer(),
                  ],
                ),
               
                const SizedBox(
                  height: 38,
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
                         launchUrl(
                          Uri.parse("tel:+01093465022")
                        );
                      },
                    ),
                    CustomSignupSocailBottom(
                      imageName: ImageAsset.facebook,
                      onPressed: () {
                         launchUrl(
                          Uri.parse("tel:+01093465022")
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 38,
                ),
                const Text(
                  "مزايا الجيم",
                  style: Styles.style20BW7,
                ),
                 const SizedBox(
                  height: 15,
                ),
                 const Text(
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق",
                  style: Styles.style16G2W7,
                ),
                const SizedBox(
          height: 100,
                      ),
              ],
            ),
          Positioned(
            bottom: 32,
            right: 16,
            left: 16,
            child: CustomButton(
              text: "الفروع",
              onPressed: () {
              },
            ),
          ),
         
        ],
      ),
    );
  }
}