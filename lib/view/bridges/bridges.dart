import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';
import 'package:smart_web/view/bridges/widgets/bridges-list.dart';
import 'package:smart_web/view/bridges/widgets/search-bridge.dart';

class BridgesScreen extends StatefulWidget {
  const BridgesScreen({super.key});

  @override
  State<BridgesScreen> createState() => _BridgesScreenState();
}

class _BridgesScreenState extends State<BridgesScreen> {
  TextEditingController searchBridge = TextEditingController();
  
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
                horizontal: isMobile ? 20.w : 75.w,
                vertical: isMobile ? 20.h : 50.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isMobile ? 20.h : 50.h),
                  Text(
                    TextConst.bridges,
                    style: TextStyle(
                      fontFamily: 'Fractul',
                      fontWeight: FontWeight.w600,
                      fontSize: isMobile ? 24.sp : 17.sp,
                      color: AppColors.textColor,
                    ),
                  ),
                  if (isMobile) ...[
                    SizedBox(height: 8.h),
                    Text(
                      'Discover cross-chain bridge protocols',
                      style: TextStyle(
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.defaultText,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            
            // Search Section
            SearchBridge(searchBridge: searchBridge),
            
            SizedBox(height: isMobile ? 20.h : 50.h),
            
            // Bridges List
            BridgesList(),
            
            SizedBox(height: isMobile ? 20.h : 50.h),
          ],
        ),
      ),
    );
  }
}
