import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';

class Boxes extends StatefulWidget {
  final String header;
  final String mainText;
  const Boxes({required this.mainText, required this.header, super.key});

  @override
  State<Boxes> createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    return Container(
      height: isMobile ? 140.h : 120.h,
      width: isMobile ? double.infinity : 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isMobile ? 20.r : 12.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.greyButton,
            AppColors.greyButton.withOpacity(0.8),
          ],
        ),
        border: Border.all(
          color: AppColors.buttonColor.withOpacity(isMobile ? 0.3 : 0.2),
          width: isMobile ? 2 : 1,
        ),
        boxShadow: isMobile ? [
          BoxShadow(
            color: AppColors.buttonColor.withOpacity(0.15),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ] : [],
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 24.w : 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.header,
              style: TextStyle(
                color: AppColors.defaultText,
                fontFamily: 'Sora',
                fontSize: isMobile ? 20.sp : 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: isMobile ? 20.h : 10.h),
            Text(
              widget.mainText,
              style: TextStyle(
                fontFamily: 'Fractul',
                fontWeight: FontWeight.w800,
                fontSize: isMobile ? 36.sp : 18.sp,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
