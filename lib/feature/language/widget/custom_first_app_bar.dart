import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:flutter/material.dart';

class CustomFisrtAppBar extends StatelessWidget implements PreferredSizeWidget{
  
  const CustomFisrtAppBar({
    super.key, 
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      
     actions: [
     Padding(
       padding: const EdgeInsets.symmetric(horizontal: 22),
       child: Image.asset(
           ImageAsset.logo,
            width: 55,
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