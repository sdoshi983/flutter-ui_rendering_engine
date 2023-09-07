import 'package:flutter/material.dart';
import 'package:ui_rendering_engine/utils/utils.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          imgPlaceholder,
          scale: 3,
        ),
        // SizedBox(height: context.screenHeight * 0.02),
        const Text(
          'Invalid Data!',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),
        ),
      ],
    );
  }
}
