import 'package:active_app/core/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key,required this.commitmentLevels, required this.bottomtitle});
  final List<int> commitmentLevels;
  final List<String> bottomtitle ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          maxY: 7,
          barGroups: _createBarGroups(),
          borderData: FlBorderData(show: true, ),
          titlesData: FlTitlesData(
            topTitles:const AxisTitles(
              sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: _bottomTitles,
              ),
            ),
            leftTitles:const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles:const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),
          barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  // Customize tooltip text
                  return BarTooltipItem(
                    '${rod.toY}',
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
                tooltipPadding: const EdgeInsets.all(8),
                tooltipMargin: 8,

              ),
             
            ),
          gridData:const FlGridData(
            show: true,
            drawVerticalLine: false,
            drawHorizontalLine: true,
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    return List.generate(
      commitmentLevels.length,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
           gradient:const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [ColorApp.kPrimaryColor,ColorApp.secondColor]),
            width: 30,
            borderRadius: BorderRadius.zero,
            toY: commitmentLevels[index].toDouble(),
            color: ColorApp.kPrimaryColor,
          ),
          
        ],
      ),
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta) { 
    final week = bottomtitle[value.toInt() % bottomtitle.length];
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(week),
    );
  }
}

