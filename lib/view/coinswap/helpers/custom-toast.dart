// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CustomToast {
  static void show(BuildContext context, String message,
      {Duration duration = const Duration(seconds: 5)}) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 120.h, // Position near the bottom
        right: MediaQuery.of(context).size.width * 0.01, // Center horizontally
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(22, 155, 160, 206),
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppColors.greenColor)),
            child: Row(
              spacing: 3.w,
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppColors.greenColor,
                ),
                Text(
                  message,
                  style: TextstyleConstant().commonTextGreenF3SemiBold,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 10.sp,
                      color: AppColors.textColor,
                    ))
              ],
            ),
          ),
        ),
      ),
    );

    // Insert the overlay into the widget tree
    Overlay.of(context).insert(overlayEntry);

    // Remove the overlay after a duration
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}
