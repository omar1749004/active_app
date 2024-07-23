import 'package:active_app/controller/training_controller.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/training/widget/repet_bottomsheet.dart';
import 'package:active_app/feature/training/widget/training_info_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTrainingContainer extends GetView<TrainingControllerImp> {
  const CustomTrainingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
            onTap: () {
                repetBottomSheet(controller);
            },
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffDADADA),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Image.asset(
                      ImageAsset.sixPagesImage,
                      width: 88,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "All Body Hustle ",
                          style: Styles.style18BW5,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("3*10", style: Styles.style15G2W4),
                      ],
                    ),
                  ),
                const  Icon(
                    Icons.check_circle,
                    color: ColorApp.kPrimaryColor,
                  ),
                 const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    onPressed: () {
                      trainingInfoBottomSheet();
                    },
                    icon: const Icon(Icons.info_outline),
                    color: ColorApp.gray2,
                  ),
                ],
              ),
            ),
          );
  }
}





  

  Widget buildRecordingGroupsSection() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Checkbox(value: false, onChanged: (value) {}),
          title: Text('Group 1'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Add more groups here
      ],
    );
  }

  Widget buildPreviousRecordsSection() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          title: Text('Record 1'),
          subtitle: Text('Date: 2023-05-20'),
        ),
        // Add more records here
      ],
    );
  }