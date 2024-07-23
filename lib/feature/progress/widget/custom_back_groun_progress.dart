import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/shared/custom_botton_copy.dart';
import 'package:flutter/material.dart';

class CustomBackGrounProgress extends StatelessWidget {
  const CustomBackGrounProgress({super.key, required this.showOffer});
final String showOffer ;
  @override
  Widget build(BuildContext context) {
    return Container(
              padding:const EdgeInsets.symmetric(vertical: 22),
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 135, 133, 133) , // Change color and opacity as needed
                     BlendMode.multiply, // Change blend mode as needed
                    ),
                    image: AssetImage(ImageAsset.progress),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    
                    children: [
                      Text(
                       showOffer,
                        style: Styles.style30W,
                      ),
                      SizedBox(
                        width: 112,
                        child: CustomBotton1(ontap: (){},
                         text: "العروض",
                          color: ColorApp.kPrimaryColor,
                          marginTop: 15,
                          marginLeft: 0,
                          marginRight: 0,
                          ),
                      )
                    ],
                  ),
                ));
  }
}