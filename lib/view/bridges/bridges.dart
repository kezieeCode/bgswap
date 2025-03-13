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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 550.w, top: 100.h),
              child: Text(
                TextConst.bridges,
                style: TextStyle(
                    fontFamily: 'Fractul',
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                    color: AppColors.textColor),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            SearchBridge(searchBridge: searchBridge),
            SizedBox(height: 50.h,),
            BridgesList()
          ],
        ),
      ),
    );
  }
}
