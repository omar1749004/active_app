import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class ImportantPointCard extends StatelessWidget {
 
 const ImportantPointCard({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, 
      color:  ColorApp.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
            List.generate(3 , (index) => _buildPoint("First important point"))    
        ),
      ),
    );
  }

  Widget _buildPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:const EdgeInsets.only(top: 6),
          width: 10,
          height: 10,
          decoration:const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red, // Customize color as needed
          ),
        ),
       const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black, 
              height: 1.5
            ),
          ),
        ),
      ],
    );
  }
}