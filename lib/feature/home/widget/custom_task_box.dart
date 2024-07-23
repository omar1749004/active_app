import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CustomTaskBox extends StatelessWidget {
  const CustomTaskBox(
      {super.key,
      required this.image,
      required this.textOne,
      required this.textTow,
      required this.textTree,
      required this.icon,
      required this.onTap});
  final String image;
  final String textOne;
  final String textTow;
  final String textTree;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 121,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffDADADA),
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 20,
                      color: ColorApp.gray2,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      textOne,
                      style: Styles.style15G2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  textTow,
                  style: Styles.style20BW5,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  textTree,
                  style: Styles.style15W5,
                )
              ],
            ),
            ClipRRect(
              borderRadius:const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                image,
                width: 130,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
