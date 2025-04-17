// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';

class ButtonConstant {
  // A method to create reusable ElevatedButton widgets
  Widget createButton({
    required BuildContext context, // Pass BuildContext as a parameter
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
            borderRadius: 
            MediaQuery.of(context).size.width < 600
                ? BorderRadius.circular(30.sp) // Rounded corners for desktop
                :  // Rounded corners for mobile
            BorderRadius.circular(4.sp), // Rounded corners
          ),
        ),
        child: child);
  }
}

class ButtonConstantMobile {
  // A method to create reusable ElevatedButton widgets optimized for mobile
  Widget createButton({
    required Widget child,
    VoidCallback? onPressed,
    Color color = AppColors.buttonColor, // Default blue background color
  }) {
    return ElevatedButton(
      onPressed: onPressed, // Action for the button
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Button background color
        padding: EdgeInsets.symmetric(
          horizontal: 40.w, // Scaled horizontal padding
          vertical: 20.h, // Scaled vertical padding
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp), // Rounded corners
        ),
        elevation: 0, // Remove shadow for a flat look
      ),
      child: child,
    );
  }
}
