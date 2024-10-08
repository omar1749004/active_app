import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImageAsset.logo,
            width: 100,
          ),
          Text(
            "Welcome To Your Home",
            style: Styles.style20.copyWith(color: Colors.white),
          ),
          //here will add another element in the future
         Padding(
           padding: const EdgeInsets.only(right: 10),
           child: ClipOval(
                                child: SizedBox.fromSize(
                                    size:const Size.fromRadius(
                                        30), // Image radius
                                    child: Image.asset(ImageAsset.logo,
             ),),),
         )
        ],
      ),
    );
  }
}
