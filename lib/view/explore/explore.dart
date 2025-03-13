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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 550.w, top: 100.h),
              child: Text(
                TextConst.explore,
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
            ValueBoxes(),
            SizedBox(height: 50.h,),
            Transactions()
        
          ],
        ),
      ),
    );
  }
}
