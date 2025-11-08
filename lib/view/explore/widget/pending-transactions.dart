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
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  late List<Map<String, dynamic>> pendingTransactions = [];
  
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    return SingleChildScrollView(
      child: Column(
        children: [
        // Search Section
          Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.w : 75.w,
            vertical: isMobile ? 10.h : 30.h,
          ),
          child: isMobile
              ? Column(
                  children: [
                    // Search Input
                    Container(
                      height: 56.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.greyButton.withOpacity(0.3),
                        border: Border.all(
                          color: AppColors.buttonColor.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontFamily: 'Sora',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                        controller: searchController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 16.h,
                          ),
                          hintText: 'Search address or hash',
                          hintStyle: TextStyle(
                            color: AppColors.defaultText,
                            fontFamily: 'Sora',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 28.sp,
                            color: AppColors.defaultText,
                          ),
                          border: InputBorder.none,
                          enabled: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // Search Button
                    Container(
                      height: 56.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.buttonColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.buttonColor.withOpacity(0.3),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(16.r),
                          child: Center(
                            child: Text(
                              'Search',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontFamily: 'Sora',
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
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
                    SizedBox(width: 20.w),
                SizedBox(
                  height: 70.h,
                  width: 70.w,
                  child: ButtonConstant().createButton(
                    context: context,
                    color: AppColors.buttonColor,
                    onPressed: () {},
                        child: Text('Search', style: TextstyleConstant().commonText2),
                  ),
                ),
              ],
            ),
        ),
        
        SizedBox(height: isMobile ? 20.h : 50.h),
        
        // Transactions List
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.w : 30.w,
          ),
            child: Container(
            width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(243, 27, 29, 37),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.greyButton.withOpacity(0.3),
                width: 1,
              ),
              ),
              child: Padding(
              padding: EdgeInsets.all(isMobile ? 16.w : 20.w),
                child: Column(
                mainAxisSize: MainAxisSize.min,
                  children: [
                  SizedBox(height: isMobile ? 20.h : 60.h),
                  
                  // Header
                  if (isMobile) ...[
                    Text(
                      'Pending Transactions',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontFamily: 'Sora',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ] else ...[
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Row(
                        children: [
                          Text('#', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 50.w),
                          Text('Sent', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 60.w),
                          Text('Recieved', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 75.w),
                          Text('Address', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 75.w),
                          Text('Date', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 80.w),
                          Text('Status', style: TextstyleConstant().navBarDefault),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Divider(
                      color: AppColors.defaultText,
                      thickness: 0.2,
                      indent: 15.w,
                      endIndent: 30.w,
                    ),
                  ],
                  
                  // Data List
                    FutureBuilder<List<Map<String, dynamic>>>(
                    future: HttpService.fetchTransactions(),
                      builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: 200.h,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.buttonColor,
                            ),
                          ),
                        );
                        } else if (snapshot.hasError) {
                        return SizedBox(
                          height: 200.h,
                          child: Center(
                            child: Text(
                              "Error: ${snapshot.error}",
                              style: TextStyle(
                                color: AppColors.dangerColor,
                                fontFamily: 'Sora',
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return SizedBox(
                          height: 200.h,
                          child: Center(
                            child: Text(
                              "No pending transactions available",
                              style: TextStyle(
                                color: AppColors.defaultText,
                                fontFamily: 'Sora',
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        );
                      }

                      List<Map<String, dynamic>> pendingTransactions = snapshot.data!;
                      pendingTransactions = pendingTransactions.where((transaction) {
                          return transaction["status"] == "Confirming";
                        }).toList();

                      return SizedBox(
                        height: isMobile ? 400.h : 800.h,
                        child: isMobile
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: pendingTransactions.length,
                                itemBuilder: (context, index) {
                                  final transaction = pendingTransactions[index];
                                  return _buildMobilePendingCard(transaction, index);
                                },
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                            itemCount: pendingTransactions.length,
                            itemBuilder: (context, index) {
                              final transaction = pendingTransactions[index];
                                  return _buildDesktopPendingRow(transaction, index);
                                },
                              ),
                      );
                    },
                  ),
                  
                  SizedBox(height: 20.h),
                  
                  // Pagination
                  NumberPaginator(
                    showNextButton: true,
                    showPrevButton: true,
                    numberPages: (pendingTransactions.length / _itemsPerPage).ceil() > 0
                        ? (pendingTransactions.length / _itemsPerPage).ceil()
                        : 1,
                    onPageChange: (page) {
                      setState(() {
                        _currentPage = page + 1;
                      });
                    },
                    initialPage: (_currentPage - 1) < 0 ? 0 : (_currentPage - 1),
                    config: NumberPaginatorUIConfig(
                      buttonUnselectedBackgroundColor: AppColors.greyButton,
                      buttonSelectedBackgroundColor: AppColors.buttonColor,
                      buttonUnselectedForegroundColor: AppColors.defaultText,
                      buttonSelectedForegroundColor: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
    );
  }

  Widget _buildMobilePendingCard(Map<String, dynamic> transaction, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.greyButton.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.buttonColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '#${index + 1}',
                  style: TextStyle(
                    color: AppColors.buttonColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    fontFamily: 'Sora',
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  '${transaction["id_hash"]}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.sp,
                    fontFamily: 'Sora',
                    color: AppColors.textColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.textColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '${transaction["status"]}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    fontFamily: 'Sora',
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 20.h),
          
          // Transaction Details
          _buildMobileDetailRow(
            'Sent',
            '${transaction["amount_and_coin_sent"]}',
            '${transaction['source_chain']}',
            true,
          ),
          
          SizedBox(height: 16.h),
          
          _buildMobileDetailRow(
            'Received',
            '${transaction["amount_and_coin_received"] ?? "N/A"}',
            '${transaction["destination_chain"]}',
            true,
          ),
          
          SizedBox(height: 16.h),
          
          _buildMobileDetailRow(
            'Address',
            '${transaction["crypto_address"]}',
            '',
            false,
          ),
          
          SizedBox(height: 16.h),
          
          _buildMobileDetailRow(
            'Date',
            '${transaction["duration"]}',
            '',
            false,
          ),
          
          SizedBox(height: 20.h),
          
          // View Details Button
          Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.buttonColor.withOpacity(0.1),
              border: Border.all(
                color: AppColors.buttonColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  CustomDialog(
                    date: '${transaction["duration"]}',
                    destChain: '${transaction['destination_chain']}',
                    sourceChain: '${transaction['source_chain']}',
                    recievedValue: '${transaction["amount_and_coin_received"]}',
                    sourceHash: '${transaction['crypto_address']}',
                    sendValue: '${transaction["amount_and_coin_sent"]}',
                    senderAddress: '${transaction["crypto_address"]}',
                    status: '${transaction['status']}',
                  ).showDetailDialog(context);
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Center(
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      color: AppColors.buttonColor,
                      fontFamily: 'Sora',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDetailRow(String label, String value, String subtitle, bool isAmount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.defaultText,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Sora',
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: TextStyle(
            color: isAmount ? AppColors.buttonColor : AppColors.textColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Sora',
          ),
        ),
        if (subtitle.isNotEmpty) ...[
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: TextStyle(
              color: AppColors.defaultText,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Sora',
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDesktopPendingRow(Map<String, dynamic> transaction, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
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
              crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${transaction["amount_and_coin_sent"]}',
                                          style: TextstyleConstant().commonText,
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '${transaction['source_chain']}',
                  style: TextstyleConstant().navBarDefault,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${transaction["amount_and_coin_received"] ?? "N/A"}',
                                          style: TextstyleConstant().commonText,
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '${transaction["destination_chain"]}',
                  style: TextstyleConstant().navBarDefault,
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
                color: transaction["status"] == "Confirming"
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
                  date: '${transaction["duration"]}',
                  destChain: '${transaction['destination_chain']}',
                  sourceChain: '${transaction['source_chain']}',
                  recievedValue: '${transaction["amount_and_coin_received"]}',
                  sourceHash: '${transaction['crypto_address']}',
                  sendValue: '${transaction["amount_and_coin_sent"]}',
                  senderAddress: '${transaction["crypto_address"]}',
                  status: '${transaction['status']}',
                ).showDetailDialog(context);
                                      },
                                      child: Text(
                                        'View',
                style: TextstyleConstant().commonTextBlue,
                                        textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
