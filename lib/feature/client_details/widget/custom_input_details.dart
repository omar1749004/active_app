import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/shared/custom_simpl_text_form.dart';
import 'package:flutter/material.dart';

class CustomInputDetails extends StatelessWidget {
  const CustomInputDetails({
    super.key, required this.text, this.myController, this.validator,
  });
 final String text ;
 final TextEditingController? myController ;
 final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text , style: Styles.style20B,),
         const SizedBox(height: 10,),
         CustomSimpleTextForm(radius: 5,isPhoneNumber: true,
         myController: myController,fontSize: 20,
         validator: validator
         )
        ],
      ),
    );
  }
}