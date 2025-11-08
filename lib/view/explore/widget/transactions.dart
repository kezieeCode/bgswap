import 'package:flutter/material.dart';
import 'package:smart_web/view/explore/widget/pending-transactions.dart';

import '../../../utils/utils.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
                    // Tab Bar
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: isMobile ? 20.w : 60.w,
                      ),
                      height: isMobile ? 60.h : 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.greyButton.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColors.buttonColor.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: TabBar(
                        labelStyle: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: isMobile ? 20.sp : 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        padding: EdgeInsets.all(isMobile ? 8.w : 0),
                dividerHeight: 0,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.buttonColor,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.textColor,
                unselectedLabelColor: AppColors.defaultText,
                tabs: const [
                  Tab(text: "View Txns"),
                  Tab(text: "Pending Txns"),
                ],
              ),
            ),
            
            SizedBox(height: isMobile ? 20.h : 30.h),
            
                    // Tab Bar View
                    SizedBox(
                      height: isMobile ? 500.h : 2500.h,
                      child: TabBarView(
                        children: [
                          ViewTxns(),
                          PendingTransactions(),
                        ],
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
