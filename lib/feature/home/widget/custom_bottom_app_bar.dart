import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar(this.isclient, {super.key});
final bool isclient  ;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      //  / elevation: 0,
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 10),
      shape: const CircularNotchedRectangle(),

      notchMargin: 12,

      child:
      GetBuilder<HomeScreenControllerImp>(builder: (controller) => 
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
           isclient? controller.listPage.length :controller.listTrainerPage.length ,
            (i) {
              return _custommBottonOfbottomAppBar(
                  icon: controller.isZoomed[i]
                      ? Transform.scale(
                          scale: 0.9,
                          child: Icon(isclient? controller.bottomAppBar[i]["icon"]:
                          controller.bottomAppBarTrainer[i]["icon"]
                           ,
                              color: controller.changeColor(i)),
                        )
                      : Icon(isclient? controller.bottomAppBar[i]["icon"]:
                       controller.bottomAppBarTrainer[i]["icon"],
                          color: controller.changeColor(i),
                          size: 22,
                          ),
                          
                  //   icon: controller.bottomAppBar[i]["icon"],
                  title:isclient? controller.bottomAppBar[i]["title"] :
                  controller.bottomAppBarTrainer[i]["title"],
                  onPressed: () {
                    controller.changePage(i);
                  },
                  onLongPressEnd: (details) {
                    controller.onLongPressEnd(i);
                     controller.changePage(i);
                  },
                  onLongPress: () {
                    controller.onLongPress(i);
                  },
                  color: controller.changeColor(i));
            },
          ),
        ],
      ),)
    );
  }
}

Widget _custommBottonOfbottomAppBar(
    {required Widget icon,
    required String title,
    required void Function()? onPressed,
    required Color color,
    required void Function(LongPressEndDetails)? onLongPressEnd,
    required void Function()? onLongPress}) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    //  splashColor: Colors.transparent,
    // highlightColor: Colors.transparent,
    onTap: onPressed,
    onLongPressEnd: onLongPressEnd,
    onLongPress: onLongPress,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        // Icon(icon,color:color ,),
        Text(
          title,
          style: TextStyle(color: color),
        ),
      ],
    ),
  );
}
