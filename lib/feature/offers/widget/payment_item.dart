import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, this.onTap});
final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.only(bottom: 20),
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(
            color: Color(0xFFC2C2C2),
          )),
          
      elevation: 4,
      child:
       InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 23),
          child: Row(
            children: [
              Image.asset(ImageAsset.vCash),
              const SizedBox(
                width: 15,
              ),
              Text(
                "فودافون كاش",
                style: Styles.style15B.copyWith(fontFamily: "Cairo"),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_back_ios,
                color: ColorApp.gray3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
