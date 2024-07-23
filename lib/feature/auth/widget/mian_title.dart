import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Gym and Spy",
      style: Styles.style25,
      textAlign: TextAlign.center,
    );
  }
}