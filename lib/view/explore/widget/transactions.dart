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
    return DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 60.w, right: 50.w),
              child: TabBar(
                labelStyle: TextstyleConstant().boldCommonTextBlue,
                padding: EdgeInsets.only(right: 500.w),
                dividerHeight: 0,
                indicatorColor:
                    AppColors.buttonColor, // Active indicator color
                labelColor:
                    AppColors.secondTextColor, // Active tab text color
                unselectedLabelColor:
                    AppColors.defaultText, // Inactive tab color
                tabs: const [
                  Tab(
                    text: "View Txns",
                  ),
                  Tab(text: "Pending Txns"),
                ],
              ),
            ),
            SizedBox(
              height: 2500.h,
              child: TabBarView(
                children: [
                  ViewTxns(),
                 PendingTransactions()
                ],
              ),
            ),
          ]),
        ));
  }
}
