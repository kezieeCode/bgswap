import 'package:flutter/material.dart';
import 'package:smart_web/view/explore/widget/transactions.dart';
import '../../utils/utils.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24.w : 75.w,
                vertical: isMobile ? 24.h : 50.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isMobile ? 24.h : 50.h),
                  Text(
                    TextConst.explore,
                    style: TextStyle(
                      fontFamily: 'Fractul',
                      fontWeight: FontWeight.w700,
                      fontSize: isMobile ? 40.sp : 20.sp,
                      color: AppColors.textColor,
                    ),
                  ),
                  if (isMobile) ...[
                    SizedBox(height: 16.h),
                    Text(
                      'Track transactions and monitor network activity',
                      style: TextStyle(
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w400,
                        fontSize: isMobile ? 20.sp : 16.sp,
                        color: AppColors.defaultText,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            
            // Value Boxes Section
            ValueBoxes(),
            
            SizedBox(height: isMobile ? 32.h : 50.h),
            
            // Transactions Section
            Transactions(),
            
            SizedBox(height: isMobile ? 32.h : 50.h),
          ],
        ),
      ),
    );
  }
}
