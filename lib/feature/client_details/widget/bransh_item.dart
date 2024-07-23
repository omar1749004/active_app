import 'package:active_app/api_link.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/data/models/brach_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BranshItem extends StatelessWidget {
  const BranshItem(
      {super.key,
      required this.branshModel,
      this.image,
      this.onTap,
      required this.isTap});
  final BranchModel branshModel;
  final String? image;
  final void Function()? onTap;
  final bool isTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorApp.gray2),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        child: Row(children: [
          image != null
              ? CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: "$linkImageUpload/$image",
                  width: 122,
                  height: 108,
                )
              : const SizedBox(
                  width: 108,
                  height: 122,
                ),
          // Image.asset(
          //    ImageAsset.branchImage, ////////////////////////////////////////////
          //   height: 108,
          //   width: 122,
          //   fit: BoxFit.fill,
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          branshModel.branchNameEn,
                          style: Styles.style24A,
                        ),
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            shape: const CircleBorder(),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            activeColor: ColorApp.kPrimaryColor,
                            value: isTap,
                            onChanged: (val) {}),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          branshModel.branchOpenDayEn,
                          style: Styles.style15A,
                        ),
                      ),
                     const SizedBox(width: 10,) ,
                      Flexible(
                        child: Text(
                          branshModel.branchOpenTime,
                          style: Styles.style15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
