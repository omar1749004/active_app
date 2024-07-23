import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CusromTextBody extends StatelessWidget {
  const CusromTextBody({
    super.key, required this.title,
  });
  final String title ;
  @override
  Widget build(BuildContext context) {
    return  Text(title,
    style: Styles.style18BW5,
    textAlign: TextAlign.center,
    );
  }
}