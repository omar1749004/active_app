import 'package:active_app/api_link.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/data/models/training_day_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomTraineingDayContainer extends StatelessWidget {
  const CustomTraineingDayContainer({
    super.key,
    this.onTap,
    required this.trainingDayModel,
    required this.nameDay, required this.isComplete,
    
  });
  final void Function()? onTap;
  final TrainingDayModel trainingDayModel;
  final String nameDay;
  final bool isComplete ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 104,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffDADADA),
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            trainingDayModel.trainingdayImage != null
                ? CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        "$linkImageUpload/${trainingDayModel.trainingdayImage}",
                    width: 122,
                    height: 108,
                  )
                : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Image.asset(
                      ImageAsset.sixPagesImage,
                      width: 90,
                      fit: BoxFit.fill,
                    ),
                  ),
            const SizedBox(
              width: 9,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ColorApp.gray3),
                  child: Text(
                    nameDay,
                    style: Styles.style15G2W4,
                  ),
                ),
                Text(
                  trainingDayModel.trainingdayName,
                  style: Styles.style20BW4,
                ),
                const Text(
                  "41 - 60 دقيقة",
                  style: Styles.style15G2W4,
                )
              ],
            ),
            const Spacer(),
            isComplete ?const  Icon(Icons.check_circle, color: Colors.green):
         const   Icon(Icons.arrow_forward, color: ColorApp.gray2)
          ],
        ),
      ),
    );
  }
}
