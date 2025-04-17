import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:smart_web/utils/utils.dart';

import '../../../apis/api-service.dart';
import '../helpers/dialog-box.dart';

class PendingTransactions extends StatefulWidget {
  const PendingTransactions({super.key});

  @override
  State<PendingTransactions> createState() => _PendingTransactionsState();
}

class _PendingTransactionsState extends State<PendingTransactions> {
  int _currentPage = 1; // Current page index
  final int _itemsPerPage = 10; // Items per page
  late List<Map<String, dynamic>> pendingTransactions = [];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 75.w, top: 30.h),
            child: Row(
              children: [
                Container(
                  height: 70.h,
                  width: 280.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: const Color.fromARGB(22, 155, 160, 206),
                  ),
                  child: TextFormField(
                    style: TextstyleConstant().navBarDefault,
                    textAlign: TextAlign.center,
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 35.h,
                      ),
                      label: Row(spacing: 100.w, children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Icon(
                            Icons.search,
                            size: 10.sp,
                            color: AppColors.defaultText,
                          ),
                        ),
                        Text(
                          'Search address/hash',
                          style: TextstyleConstant().navBarDefault,
                        ),
                      ]),
                      labelStyle: TextstyleConstant().navBarDefault,
                      enabled: true,
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                SizedBox(
                  height: 70.h,
                  width: 70.w,
                  child: ButtonConstant().createButton(
                    context: context,
                    color: AppColors.buttonColor,
                    onPressed: () {},
                    child:
                        Text('Search', style: TextstyleConstant().commonText2),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Container(
              height: 1200.h, // Can be adjusted based on your UI needs
              width: 650.w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(243, 27, 29, 37),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 60.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Row(
                        children: [
                          Text(
                            '#',
                            style: TextstyleConstant().navBarDefault,
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Text(
                            'Sent',
                            style: TextstyleConstant().navBarDefault,
                          ),
                          SizedBox(width: 60.w),
                          Text(
                            'Recieved',
                            style: TextstyleConstant().navBarDefault,
                          ),
                          SizedBox(width: 75.w),
                          Text(
                            'Address',
                            style: TextstyleConstant().navBarDefault,
                          ),
                          SizedBox(width: 75.w),
                          Text(
                            'Date',
                            style: TextstyleConstant().navBarDefault,
                          ),
                          SizedBox(width: 80.w),
                          Text(
                            'Status',
                            style: TextstyleConstant().navBarDefault,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.defaultText,
                      thickness: 0.2,
                      indent: 15.w,
                      endIndent: 30.w,
                    ),
                    FutureBuilder<List<Map<String, dynamic>>>(
                      future: HttpService
                          .fetchTransactions(), // Fetch from transactions.json
                      builder: (context, snapshot) {
                        // print(snapshot.data);
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          // print(snapshot.error);
                          return Center(
                              child: Text("Error: ${snapshot.error}"));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                              child: Text("No transactions available"));
                        }

                        List<Map<String, dynamic>> pendingTransactions =
                            snapshot.data!;
                        pendingTransactions =
                            pendingTransactions.where((transaction) {
                          return transaction["status"] == "Confirming";
                        }).toList();

                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap:
                                true, // Add this line to allow ListView to shrink
                            itemCount: pendingTransactions.length,
                            itemBuilder: (context, index) {
                              final transaction = pendingTransactions[index];
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${transaction["id_hash"]}',
                                      style: TextstyleConstant().commonText,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${transaction["amount_and_coin_sent"]}',
                                          style: TextstyleConstant().commonText,
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '${transaction['source_chain']}',
                                          style:
                                              TextstyleConstant().navBarDefault,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${transaction["amount_and_coin_received"] ?? "N/A"}',
                                          style: TextstyleConstant().commonText,
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '${transaction["destination_chain"]}',
                                          style:
                                              TextstyleConstant().navBarDefault,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${transaction["crypto_address"]}',
                                      style: TextstyleConstant().commonText,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${transaction["duration"]}',
                                      style: TextstyleConstant().commonText,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${transaction["status"]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 7.sp,
                                        fontFamily: 'Sora',
                                        color: transaction["status"] ==
                                                "Confirming"
                                            ? AppColors.textColor
                                            : AppColors.dangerColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        CustomDialog(
                                                date:
                                                    '${transaction["duration"]}',
                                                destChain:
                                                    '${transaction['destination_chain']}',
                                                sourceChain:
                                                    '${transaction['source_chain']}',
                                                recievedValue:
                                                    '${transaction["amount_and_coin_received"]}',
                                                sourceHash:
                                                    '${transaction['crypto_address']}',
                                                sendValue:
                                                    '${transaction["amount_and_coin_sent"]}',
                                                senderAddress:
                                                    '${transaction["crypto_address"]}',
                                                status:
                                                    '${transaction['status']}')
                                            .showDetailDialog(context);
                                      },
                                      child: Text(
                                        'View',
                                        style:
                                            TextstyleConstant().commonTextBlue,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 75.h,
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                    NumberPaginator(
                      // prevButtonContent: Icon(Icons.arrow_back_ios),
                      showNextButton: true,
                      showPrevButton: true,
                      numberPages: (pendingTransactions.length / _itemsPerPage)
                                  .ceil() >
                              0
                          ? (pendingTransactions.length / _itemsPerPage).ceil()
                          : 1, // Ensure numberPages is at least 1
                      onPageChange: (page) {
                        setState(() {
                          _currentPage = page + 1;
                        });
                      },
                      initialPage: (_currentPage - 1) < 0
                          ? 0
                          : (_currentPage -
                              1), // Ensure initialPage is not negative
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
