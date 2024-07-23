import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class SubscriptionInfoCard extends StatelessWidget {
  final int sessionsAttended;
  final int sessionsRemaining;
  final String startDate;
  final String endDate;
  final int daysRemaining;
  final void Function()? onTap ;

  const SubscriptionInfoCard({
    required this.sessionsAttended,
    required this.sessionsRemaining,
    required this.startDate,
    required this.endDate,
    required this.daysRemaining,
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          border: Border.all(color: ColorApp.kPrimaryColor),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Row for top information
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn(
                icon: Icons.check_circle_outline,
                title: 'عدد الجلسات التي حضرتها',
                value: '$sessionsAttended',
              ),
              _buildInfoColumn(
                icon: Icons.timelapse,
                title: 'عدد الجلسات المتبقية',
                value: '$sessionsRemaining',
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Row for bottom information
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn(
                icon: Icons.calendar_today,
                title: 'تاريخ البداية',
                value: startDate,
              ),
              _buildInfoColumn(
                icon: Icons.calendar_today_outlined,
                title: 'تاريخ النهاية',
                value: endDate,
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Center information
          Text(
            'عدد الأيام المتبقية\n$daysRemaining',
            style:
                Styles.style15G2.copyWith(fontSize: 20, color: ColorApp.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'الاطلاع علي العروض لتجديد الاشتراك',
              style: Styles.style15W5.copyWith(decoration: TextDecoration.underline)
             
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(
      {required IconData icon, required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: ColorApp.kPrimaryColor, size: 30),
        const SizedBox(height: 5),
        Text(
          title,
          style: Styles.style15,
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: Styles.style16.copyWith(
            color: ColorApp.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
