import 'package:flutter/material.dart';
import 'package:smart_web/apis/api-service.dart';

import '../../../../../utils/utils.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(5.sp),
         color: AppColors.backgroundColor,
      ),
      
      width: 260.w,
      height: 520.h,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Makes modal height dynamic
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  "Transaction History",
                  style: TextstyleConstant().commonText,
                ),
                SizedBox(
                  width: 120.w,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 7.sp,
                    ))
              ],
            ),
            SizedBox(
              height: 5.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("2 items",
                    style: TextstyleConstant().commonTextDefaultF2Regular),
                SizedBox(
                  width: 100.w,
                ),
                Text('Clear all',
                    style: TextStyle(
                        color: AppColors.secondTextColor,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w600,
                        fontSize: 5.sp))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: HttpService.fetchTransactions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error loading transactions');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No transactions available');
                } else {
                  final transactions = snapshot.data!.take(2).toList();
                  return Column(
                    children: transactions.map((transaction) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 25.h),
                        child: TransactionBox(
                          date: '${transaction["duration"]}',
                          sendingNetworkLogo: transaction["sending_network_logo"],
                          recieversNetworkLogo: transaction["recieving_network_logo"],
                          sendingAmount: transaction["amount_and_coin_sent"],
                          sendingNetwork: transaction["source_chain"],
                          recieversAmount:
                              transaction["amount_and_coin_received"],
                          recieversNetwork: transaction["destination_chain"],
                          status: transaction["status"],
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
