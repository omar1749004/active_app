import 'package:active_app/controller/profile_controller.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageProfile extends GetView<ProfileControllerImp> {
  const CustomImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: controller.localImageFile != null ? FileImage(controller.localImageFile!) : null,
                    child:controller.localImageFile == null ?Text(
                                  controller.name[0].toUpperCase(),
                                  style: TextStyle(fontSize: 70),
                                ) : null
                    // controller.localImageFile != null
                    //         ? Image.file(
                    //               controller.localImageFile!,
                    //             width: 40,
                    //             height: 40,
                    //           )
                    //         : 
                    //            Text(
                    //               controller.name[0].toUpperCase(),
                    //             ),
                              
                   // Image.asset(ImageAsset.branchImage) == null ? Icon(Icons.person, size: 60) : null,
                  ),
                  Positioned(
                    right: 4,
                    bottom: 4,
                    child: GestureDetector(
                      onTap: (){},
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorApp.kPrimaryColor,
                        child: Icon(Icons.camera_alt, color: Colors.white),
                      ),
                    ),
                  ),
                ],);
  }
}