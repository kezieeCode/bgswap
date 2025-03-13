// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';

class ButtonConstant {
  // A method to create reusable ElevatedButton widgets
  Widget createButton({
    required Widget child,
    VoidCallback? onPressed,
    TextStyle? style,
    Color? color, // Default button background color
  }) {
    return ElevatedButton(
        onPressed: onPressed, // Action for the button
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.sp), // Rounded corners
          ),
        ),
        child: child);
  }
}
