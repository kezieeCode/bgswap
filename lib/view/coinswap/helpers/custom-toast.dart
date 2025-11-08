// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CustomToast {
  static void show(BuildContext context, String message,
      {Duration duration = const Duration(seconds: 5)}) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 120.h,
        right: MediaQuery.of(context).size.width * 0.01,
        left: isMobile ? MediaQuery.of(context).size.width * 0.05 : null,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 20, 
              vertical: isMobile ? 16 : 10
            ),
            decoration: BoxDecoration(
                color: const Color.fromARGB(22, 155, 160, 206),
                borderRadius: BorderRadius.circular(isMobile ? 20.sp : 15.r),
                border: Border.all(
                  color: AppColors.greenColor,
                  width: isMobile ? 2 : 1,
                )),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: isMobile ? 12.w : 3.w,
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppColors.greenColor,
                  size: isMobile ? 32.sp : null,
                ),
                Flexible(
                  child: Text(
                    message,
                    style: isMobile 
                      ? TextstyleConstantMobile().commonTextGreenF3SemiBold.copyWith(fontSize: 22.sp)
                      : TextstyleConstant().commonTextGreenF3SemiBold,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      overlayEntry.remove();
                    },
                    icon: Icon(
                      Icons.close,
                      size: isMobile ? 28.sp : 10.sp,
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
