import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/feature/progress/widget/custom_barchart.dart';
import 'package:flutter/material.dart';

class BartChartCard extends StatelessWidget {
  const BartChartCard(
      {super.key,
      required this.commitmentLevels,
      required this.title});
  final List<int> commitmentLevels;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.style18.copyWith(color: Colors.black),
          ),
         const SizedBox(
            height: 14,
          ),
          CustomBarChart(
            commitmentLevels: commitmentLevels,
            bottomtitle: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
          ),
        ],
      ),
    );
  }
}
