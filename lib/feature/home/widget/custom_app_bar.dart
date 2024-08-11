
import 'package:active_app/controller/home_screen_controller.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView<HomeScreenControllerImp>
    implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onTapProfile,
    this.onTapAbout,
    this.onTapNotifi,
    this.isclient = true,
  });
  final void Function()? onTapProfile;
  final void Function()? onTapAbout;
  final void Function()? onTapNotifi;
  final bool isclient;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), // Adjust the radius as needed
          bottomRight: Radius.circular(20), // Adjust the radius as needed
        ),
      ),
      actions: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    controller.goToProfilePage();
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: controller.localImageFile != null
                            ? Image.file(
                                  controller.localImageFile!,
                                width: 40,
                                height: 40,
                              )
                            : CircleAvatar(
                                radius: 20,
                                child: Text(
                                  controller.name[0].toUpperCase(),
                                ),
                              ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        controller.name,
                        style: Styles.style16W6,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (isclient)
                  InkWell(
                    onTap: onTapAbout,
                    child: const Icon(
                      Icons.info,
                      color: ColorApp.white,
                      size: 30,
                    ),
                  ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: onTapNotifi,
                  child: const Icon(
                    Icons.notifications,
                    color: ColorApp.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65); //80
}
