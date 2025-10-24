import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../apis/api-service.dart';
import '../../../utils/utils.dart';

class BridgesList extends StatefulWidget {
  const BridgesList({super.key});

  @override
  State<BridgesList> createState() => _BridgesListState();
}

class _BridgesListState extends State<BridgesList> {
  int _currentPage = 1; // Current page index
  final int _itemsPerPage = 10; // Items per page
  late List<Map<String, dynamic>> validators = [];
  
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    return Column(
      children: [
        SizedBox(height: isMobile ? 20.h : 50.h),
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
                    // Mobile Header
                    Text(
                      'Bridge Protocols',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontFamily: 'Sora',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ] else ...[
                    // Desktop Header
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Row(
                        children: [
                          Text('#', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 70.w),
                          Text('Name', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 60.w),
                          Text('Token Address', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 60.w),
                          Text('Underlying', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 60.w),
                          Text('Chain', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 60.w),
                          Text('Supply', style: TextstyleConstant().navBarDefault),
                          SizedBox(width: 60.w),
                          Text('TVL(USD)', style: TextstyleConstant().navBarDefault),
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
                    future: HttpService.fetchBridges(),
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
                              style: TextstyleConstantMobile().commonText.copyWith(
                                color: AppColors.dangerColor,
                              ),
                            ),
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return SizedBox(
                          height: 200.h,
                          child: Center(
                            child: Text(
                              "No bridges available",
                              style: TextstyleConstantMobile().commonText.copyWith(
                                color: AppColors.defaultText,
                              ),
                            ),
                          ),
                        );
                      }

                      List<Map<String, dynamic>> bridges = snapshot.data!;

                      return SizedBox(
                        height: isMobile ? 400.h : 800.h,
                        child: isMobile
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: bridges.length,
                                itemBuilder: (context, index) {
                                  final bridge = bridges[index];
                                  return _buildMobileBridgeCard(bridge, index);
                                },
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: bridges.length,
                                itemBuilder: (context, index) {
                                  final bridge = bridges[index];
                                  return _buildDesktopBridgeRow(bridge, index);
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
                    numberPages: (validators.length / _itemsPerPage).ceil() > 0
                        ? (validators.length / _itemsPerPage).ceil()
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
    );
  }

  Widget _buildMobileBridgeCard(Map<String, dynamic> bridge, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.greyButton.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
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
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  '#${index + 1}',
                  style: TextstyleConstantMobile().commonText.copyWith(
                    color: AppColors.buttonColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  bridge["coin_name"] ?? "Unknown",
                  style: TextstyleConstantMobile().commonText.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 12.h),
          
          // Details
          _buildMobileDetailRow(
            'Token Address',
            bridge["token_address"] != null
                ? '${bridge["token_address"].substring(0, 7)}...${bridge["token_address"].substring(bridge["token_address"].length - 4)}'
                : "N/A",
            true,
          ),
          
          _buildMobileDetailRow(
            'Underlying',
            bridge["underlying"] != null
                ? '${bridge["underlying"].substring(0, 7)}...${bridge["underlying"].substring(bridge["underlying"].length - 4)}'
                : "N/A",
            true,
          ),
          
          _buildMobileDetailRow(
            'Chain',
            bridge["chain"] ?? "N/A",
            false,
          ),
          
          _buildMobileDetailRow(
            'Supply',
            bridge["supply"] ?? "N/A",
            false,
          ),
          
          _buildMobileDetailRow(
            'TVL (USD)',
            bridge["tvl(usd)"]?.toString() ?? "N/A",
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDetailRow(String label, String value, bool isAddress) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              label,
              style: TextstyleConstantMobile().commonText.copyWith(
                color: AppColors.defaultText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              value,
              style: TextstyleConstantMobile().commonText.copyWith(
                color: isAddress ? AppColors.buttonColor : AppColors.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopBridgeRow(Map<String, dynamic> bridge, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '${'${bridge["id_hash"]}'.substring(0, 4)}...',
              style: TextstyleConstant().commonText,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text(
                '${bridge["coin_name"]}',
                style: TextstyleConstant().commonText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text(
                bridge["token_address"] != null
                    ? '${bridge["token_address"].substring(0, 7)}...${bridge["token_address"].substring(bridge["token_address"].length - 4)}'
                    : "N/A",
                style: TextstyleConstant().commonTextBlue,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                bridge["underlying"] != null
                    ? '${bridge["underlying"].substring(0, 7)}...${bridge["underlying"].substring(bridge["underlying"].length - 4)}'
                    : "N/A",
                style: TextstyleConstant().commonTextBlue,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                '${bridge["chain"]}',
                style: TextstyleConstant().commonText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '${bridge["supply"]}',
              style: TextstyleConstant().commonText,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text(
                bridge["tvl(usd)"]?.toString() ?? "N/A",
                style: TextstyleConstant().commonText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
