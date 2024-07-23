import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({super.key, required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("التقدم العام",
                style: Styles.style18.copyWith(color: ColorApp.black)),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              color: ColorApp.kPrimaryColor,
            ), // Example progress
            const SizedBox(height: 10),
            Text('${progress * 100}% مكتمل', style: Styles.style15G2W7),
          ],
        ),
      ),
    );
  }
}